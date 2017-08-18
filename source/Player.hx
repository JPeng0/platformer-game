package; 

import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;

#if VIRTUAL_PAD
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxDestroyUtil;
#end

class Player extends FlxSprite
{

	public var dying:Bool = false;

	#if VIRTUAL_PAD
	public static var virtualPad:FlxVirtualPad;
	#end

	//static vars
	public static inline var RUN_SPEED:Int = 90;
	public static inline var GRAVITY:Int = 620;
	public static inline var JUMP_SPEED:Int = 250;
	public static inline var JUMPS_ALLOWED:Int = 2;
	public static inline var BULLET_SPEED:Int = 200;
	public static inline var GUN_DELAY:Float = 0.1;

	private var _dyingTimer:Float = 2;
	private var _deathCallback:FlxSprite->Void;
	private var _cooldown:Float;
	private var _aim:Int = FlxObject.RIGHT;
	//private var _bullets:FlxTypedGroup<Bullet>;
	public var flickering:Bool = false;
	private var _jumpPower:Int = 800;
	private var _jumpTimes:Int = 1;
	private var _gibs:FlxEmitter;
	private var i:Int = 1;

	public function new(X:Float, Y:Float)
	{
		super(X, Y);
		
		loadGraphic("assets/images/player1.png", true, 15, 24);
		
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		
		// Bounding box tweaks
		//width = 6;
		//height = 7;
		//offset.set(1, 1);
		
		// Basic player physics
		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED, JUMP_SPEED);
		acceleration.y = GRAVITY;
		//_cooldown = GUN_DELAY; 

		// Animations
		animation.add(Animation.IDLE, [0,1,2,3], 3, true);
		animation.add(Animation.IDLE_UP, [5]);

		animation.add(Animation.RUN, [4, 5], 8, true);
		//animation.add(Animation.RUN_UP, [6, 7, 8, 5], 12);
		
		animation.add(Animation.JUMP, [5]);
		//animation.add(Animation.JUMP_UP, [9]);
		//animation.add(Animation.JUMP_DOWN, [10]);
		
		// Bullet stuff
		//_bullets = Bullets;
		
		#if VIRTUAL_PAD
		virtualPad = new FlxVirtualPad(FULL, A_B);
		virtualPad.alpha = 0.5;
		#end

		health = 10;
		//_deathCallback = DeathCallback;
	}

	override public function kill():Void 
	{
		health = 0;
		dying = true;
		_dyingTimer = 1;
		
		//_deathCallback(this);
		FlxG.camera.shake(.05, .2);
		FlxG.camera.flash(FlxColor.WHITE, .1);
	}

	override public function update(elapsed:Float):Void
	{
		// Smooth slidey walking controls
		acceleration.x = 0;
		acceleration.y = GRAVITY;
		if (velocity.y == 0)
			i = 1;
		
		updateKeyboardInput();
		updateGamepadInput();
		updateVirtualPadInput();
		updateAnimations();
		FlxG.log.advanced(i);

		if (dying)
		{
			if (_dyingTimer > 0)
			{
				_dyingTimer -= elapsed * 2;
				alpha = _dyingTimer;
			}
			else
			{
				alive = false;
				exists = false;
			}
		}
		
		super.update(elapsed);
	}

	override public function hurt(Damage:Float):Void
	{
		Damage = 0;
		
		if (flickering)
			return;
		
		FlxG.sound.play("assets/sounds/hurt");
		
		flicker(1.3);
		 
		health -= 1;
		
		if (velocity.x > 0)
			velocity.x = -maxVelocity.x;
		else
			velocity.x = maxVelocity.x;
		
		super.hurt(Damage);
	}
	public function setJumps(times:Int)
	{
		_jumpTimes = times;
	}
	private function flicker(Duration:Float):Void
	{
		FlxSpriteUtil.flicker(this, Duration, 0.02, true, true, function(_)
		{
			flickering = false;
		});
		flickering = true;
	}

	private function updateKeyboardInput():Void
	{
		#if FLX_KEYBOARD
		if (FlxG.keys.anyPressed([A, LEFT]))
			moveLeft();
		else if (FlxG.keys.anyPressed([D, RIGHT]))
			moveRight();
		
		//if (FlxG.keys.anyPressed([W, UP]))
			//moveUp();
		else if (FlxG.keys.anyPressed([S, DOWN]))
			moveDown();
		
		if (FlxG.keys.anyJustPressed([W, UP]))
			{ 
				jump();
				i++;
			}
		if (FlxG.keys.pressed.Z)
			return;
		#end
	}
	
	private function updateVirtualPadInput():Void
	{
		#if VIRTUAL_PAD
		if (virtualPad.buttonLeft.pressed)
			moveLeft();
		else if (virtualPad.buttonRight.pressed)
			moveRight();
		
		if (virtualPad.buttonUp.pressed)
			moveUp();
		else if (virtualPad.buttonDown.pressed)
			moveDown();
		
		if (virtualPad.buttonA.justPressed)
			jump();
		if (virtualPad.buttonB.pressed)
			shoot();
		#end
	}
	
	private function updateGamepadInput():Void
	{
		#if FLX_GAMEPAD
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		if (gamepad == null)
			return;
		
		if (gamepad.analog.value.LEFT_STICK_X < 0 || gamepad.pressed.DPAD_LEFT)
			moveLeft();
		else if (gamepad.analog.value.LEFT_STICK_X > 0 || gamepad.pressed.DPAD_RIGHT)
			moveRight();
		
		if (gamepad.analog.value.LEFT_STICK_Y < 0 || gamepad.pressed.DPAD_UP)
			moveUp();
		else if (gamepad.analog.value.LEFT_STICK_Y > 0 || gamepad.pressed.DPAD_DOWN)
			moveDown();
		
		if (gamepad.justPressed.A)
			jump();
		
		if (gamepad.pressed.X)
			return;
		#end
	}
	
	private function updateAnimations():Void
	{
		if (velocity.y != 0)
		{
			animation.play(Animation.JUMP);
		}
		else if (velocity.x == 0)
		{
			animation.play(if (_aim == FlxObject.UP) Animation.IDLE_UP else Animation.IDLE);
		}
		else
		{
			animation.play(Animation.RUN);
		}
	}
	
	function moveLeft():Void
	{
		facing = _aim = FlxObject.LEFT;
		acceleration.x -= drag.x;
	}
	
	function moveRight():Void
	{
		facing = _aim = FlxObject.RIGHT;
		acceleration.x += drag.x;
	}
	
	function moveUp():Void
	{
		_aim = FlxObject.UP;
	}
	
	function moveDown():Void
	{
		_aim = FlxObject.DOWN;
	}
	
	function jump():Void
	{
		if (i <= _jumpTimes)
			velocity.y = -_jumpPower;
			FlxG.sound.play("assets/sounds/jump");
	}
}


@:enum abstract Animation(String) to String
{
	var IDLE = "idle";
	var IDLE_UP = "idle_up";

	var JUMP = "jump";
	var JUMP_UP = "jump_up";
	var JUMP_DOWN = "jump_down";

	var RUN = "run";
	var RUN_UP = "run_up";
}
