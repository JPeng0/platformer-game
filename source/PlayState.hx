package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.touch.FlxTouch;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _map:FlxTilemap;
	private var _starting:Bool = true;
	private var _launchedSubstate:Bool = false;
	override public function create():Void
	{
		super.create();
		
		// Then we add the player and set up the scrolling camera,
		// which will automatically set the boundaries of the world.
		add(_player);
		
		FlxG.camera.setScrollBoundsRect(0, 0, 640, 640, true);
		FlxG.camera.follow(_player, PLATFORMER);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_starting)
				{
					_starting = false;
					openSubState(new MenuState());
				}

	}

	//private function playerMovements():Void
	//{

	//}

	private function playerMovement():Void
	{
		var v:Float = 0;
		
		#if android
		var t:FlxTouch = FlxG.touches.getFirst();
		
		if (t!=null)
		{
			if (t.y < _player.y - (_player.height / 2))
				v -= 120;
			else if (t.y > _player.y + _player.height + (_player.height / 2))
				v += 120;
		}
		#end
		
		#if FLX_KEYBOARD
		if (FlxG.keys.anyPressed([UP, W]))
			v -= 120;
		if (FlxG.keys.anyPressed([DOWN, S]))
			v += 120;
		#end
		
		if (v < 0)
			_player.animation.play("up");
		else if (v > 0)
			_player.animation.play("down");
		else
			_player.animation.play("normal");
		_player.velocity.y = v;
		v = _chaser.velocity.x;
		
		#if android
		if (t!=null)
		{
			if (t.x < _player.x)
				v -= 90;
			else if (t.x > _player.x + _player.width)
				v += 90;
		}
		#end
		
		#if FLX_KEYBOARD
		if (FlxG.keys.anyPressed([LEFT, A]))
			v -= 90;
		if (FlxG.keys.anyPressed([RIGHT, D]))
			v += 90;
		#end
		
		_player.velocity.x = v;
		
		#if android
		var t:FlxTouch = FlxG.touches.getFirst();
		if (t != null && t.pressed)
		{
			shootPBullet();
		}
		#end
		
		#if FLX_KEYBOARD
		if (FlxG.keys.anyPressed([SPACE, X]))
		{
			shootPBullet();
		}
		#end
	}

}
