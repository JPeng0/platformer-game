package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.input.touch.FlxTouch;
import flixel.text.FlxText;
import flixel.util.FlxGradient;
import flixel.ui.FlxButton;

using flixel.util.FlxSpriteUtil;

class MenuState extends FlxSubState
{
	private var _btnPlay:FlxButton;
	override public function create():Void
	{

		_btnPlay = new FlxButton(0,0,"Play", clickplay);
		add(_btnPlay);
		_btnPlay.screenCenter();
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickplay():Void {
		FlxG.switchState(new PlayState());
	}

}