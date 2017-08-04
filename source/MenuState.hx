package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.input.touch.FlxTouch;
import flixel.text.FlxText;
import flixel.util.FlxGradient;
import flixel.ui.FlxButton;

using flixel.util.FlxSpriteUtil;

class MenuState extends FlxState
{
	private var _btnPlay:FlxButton;
	override public function create():Void
	{
		#if FLX_MOUSE
		FlxG.mouse.visible = true;
		#end

		FlxG.state.bgColor = 0xFF101414;

		_btnPlay = new FlxButton(0,0,"Play");
		add(_btnPlay);
		_btnPlay.screenCenter();
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.anyJustPressed([SPACE, ENTER, X]))
		{
		
			FlxG.cameras.flash(0xffd8eba2, 0.5);
			FlxG.cameras.fade(0xff131c1b, 1, false, play);
		}
	}

	private function play():Void {
		FlxG.switchState(new PlayState());
	}

}