import flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author David Bell
 */
class Enemy extends FlxSprite
{
	private var _speed:Int;
	private var _gravity:Int;
	private var _health:Int;
	private var _detection:Int;
	private var _spawntime:Float;
	private var _jumpSpeed:Int;
	private var _player:Player;
	private var _startx:Float;
	private var _starty:Float;
	//private var _spawntimer:Float;
	private var _cooldown:Float;
	
	public function new(
		X:Float,
		Y:Float,
		ThePlayer:Player,
		Speed:Int,
		JumpSpeed:Int,
		Gravity:Int,
		Health:Int,
		Detection:Int,
		SpawnTime:Int

		)
	{
		super(X, Y);
		_player = ThePlayer;
		_spawntimer = 0;
		_playdeathsound = true;
		_cooldown = 0;
		
		loadGraphic("assets/art/lurkmonsta.png", true, 16, 17);
		
		animation.add("walking", [0, 1], 18, true);
		animation.add("wrecked", [4, 5], 18, true);
		animation.add("idle", [0]);
		drag.x = Speed * 9;
		drag.y = JumpSpeed * 7;
		acceleration.y = Gravity;
		maxVelocity.x = Speed;
		maxVelocity.y = JumpSpeed;
		health = HEALTH;
		offset.x = 3;
		width = 10;
	}
	
	override public function update(elapsed:Float):Void
	{
		if (touching == FlxObject.DOWN)
		{
			if (health <= 0 && _playdeathsound)
			{
				FlxG.sound.play("assets/sounds/mondead2" + Reg.SoundExtension, 1, false);
				_playdeathsound = false;
			}
		}
		
		// Animation
		if ((velocity.x == 0) && (velocity.y == 0))
		{ 
			animation.play("idle");
		}
		else if (health < HEALTH)
		{ 
			if (velocity.y == 0)
			{ 
				animation.play("wrecked");
			}
			else 
			{
				animation.play("burning");
			} 
		}
		else 
		{ 
			animation.play("walking"); 
		}
		
		if (health > 0)
		{
			if (velocity.y == 0)
			{
				acceleration.y = -acceleration.y;
			}
			if (x != _startx)
			{
				acceleration.x = (_startx - x);
			}
			
			var xdistance:Float = _player.x - x;
			var ydistance:Float = _player.y - y;
			var distancesquared:Float = xdistance * xdistance + ydistance * ydistance;
			
			if (distancesquared < 45000)
			{
				shoot(_player);
			}
		}
		
		if (health <= 0)
		{
			maxVelocity.y = JumpSpeed * 4;
			acceleration.y = GRAVITY * 3;
			velocity.x = 0;
			_burntimer += elapsed;
			
			if (_burntimer >= BURNTIME)
			{
				super.kill();
				x = -10;
				y = -10;
				visible = false;
				acceleration.y = 0;
			}
			
			_spawntimer += elapsed;
			
			if (_spawntimer >= SPAWNTIME)
			{
				reset(_startx, _starty);
			}
		}
		
		_cooldown += elapsed;
		super.update(elapsed);
	}
	
	override public function reset(X:Float, Y:Float):Void 
	{
		super.reset(X, Y);
		
		health = HEALTH;
		_spawntimer = 0;
		_burntimer = 0;
		acceleration.y = GRAVITY;
		maxVelocity.y = JumpSpeed;
		_playdeathsound = true;
	}
	
	override public function hurt(Damage:Float):Void 
	{
		if (x > _player.x)
		{
			velocity.x = drag.x * 4;
		}
		else
		{
			velocity.x = -drag.x * 4;
		}
		
		FlxSpriteUtil.flicker(this, 0.5);
		FlxG.sound.play("assets/sounds/monhurt2" + Reg.SoundExtension, 1, false);
		health -= 1;
	}
	
	private function move(P:Player):Void 
	{
		//movement mechanics
		
	}
	
	private function attack(P:Player):Void 
	{
		//attack mechanics, if any
		
	}

	override public function kill():Void 
	{
		if (!alive)
		{ 
			return;
		}
		
		exists = true;
		solid = true;
		visible = true;
		acceleration.y = GRAVITY;
		velocity.x = 0;
	}
}
