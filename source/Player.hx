package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public var dying:Bool = false;
	private var _dyingTimer:Float = 2;
	private var _deathCallback:FlxSprite->Void;
	
	public function new(X:Int, Y:Int, DeathCallback:FlxSprite->Void) 
	{
		super(X, Y);
		
		loadGraphic(AssetPaths.spaceman__png, true, 8);
		
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		
		// Bounding box tweaks
		width = 6;
		height = 7;
		offset.set(1, 1);
		
		// Basic player physics
		var runSpeed:Int = 80;
		drag.x = runSpeed * 8;
		acceleration.y = 420;
		maxVelocity.set(runSpeed, _jumpPower);
		
		// Animations
		animation.add(Animation.IDLE, [0]);
		animation.add(Animation.IDLE_UP, [5]);

		animation.add(Animation.RUN, [1, 2, 3, 0], 12);
		animation.add(Animation.RUN_UP, [6, 7, 8, 5], 12);
		
		animation.add(Animation.JUMP, [4]);
		animation.add(Animation.JUMP_UP, [9]);
		animation.add(Animation.JUMP_DOWN, [10]);
		
		// Bullet stuff
		_bullets = Bullets;
		
		
		#if VIRTUAL_PAD
		virtualPad = new FlxVirtualPad(FULL, A_B);
		virtualPad.alpha = 0.5;
		#end
		health = 10;
		_deathCallback = DeathCallback;
	}
	
	override public function kill():Void 
	{
		health = 0;
		dying = true;
		_dyingTimer = 1;
		
		_deathCallback(this);
		FlxG.camera.shake(.05, .2);
		FlxG.camera.flash(FlxColor.WHITE, .1);
	}
	
	override public function update(elapsed:Float):Void 
	{
		acceleration.x = 0;
		
		updateKeyboardInput();
		updateGamepadInput();
		updateVirtualPadInput();
		
		updateAnimations();
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

	private function updateKeyboardInput():Void
	{
		#if FLX_KEYBOARD
		if (FlxG.keys.anyPressed([A, LEFT]))
			moveLeft();
		else if (FlxG.keys.anyPressed([D, RIGHT]))
			moveRight();
		
		if (FlxG.keys.anyPressed([W, UP]))
			moveUp();
		else if (FlxG.keys.anyPressed([S, DOWN]))
			moveDown();
		
		if (FlxG.keys.pressed.X)
			jump();
		if (FlxG.keys.pressed.C)
			shoot();
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
			shoot();
		#end
	}
	
	private function updateAnimations():Void
	{
		if (velocity.y != 0)
		{
			animation.play(switch (_aim)
			{
				case FlxObject.UP: Animation.JUMP_UP;
				case FlxObject.DOWN: Animation.JUMP_DOWN;
				default: Animation.JUMP;

			});
		}
		else if (velocity.x == 0)
		{
			animation.play(if (_aim == FlxObject.UP) Animation.IDLE_UP else Animation.IDLE);
		}
		else
		{
			animation.play(if (_aim == FlxObject.UP) Animation.RUN_UP else Animation.RUN);
		}
	}
	
	override public function hurt(Damage:Float):Void
	{
		Damage = 0;
		
		if (flickering)
			return;
		
		FlxG.sound.play("Hurt");
		
		flicker(1.3);
		 
		health -= 1;
		
		if (velocity.x > 0)
			velocity.x = -maxVelocity.x;
		else
			velocity.x = maxVelocity.x;
		
		super.hurt(Damage);
	}
	
	private function flicker(Duration:Float):Void
	{
		FlxSpriteUtil.flicker(this, Duration, 0.02, true, true, function(_)
		{
			flickering = false;
		});
		flickering = true;
	}

	unction moveLeft():Void
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
		if (isReadyToJump && (velocity.y == 0))
		{
			velocity.y = -_jumpPower;
			FlxG.sound.play("Jump");
		}
	}
	function shoot():Void
	{
		getMidpoint(_point);
					_bullets.recycle(Bullet.new).shoot(_point, _aim);
					
					if (_aim == FlxObject.DOWN)
					{
						velocity.y -= 36;
					}
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