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
	public static inline var TILE_SIZE:Int = 8;
	public static inline var MAP_WIDTH_IN_TILES:Int = 80;
	public static inline var MAP_HEIGHT_IN_TILES:Int = 80;

	private var _map:Array<Int>;
	private var _map:FlxTilemap;
	private var _starting:Bool = true;
	private var _launchedSubstate:Bool = false;

	//object storage
	private var _player:Player;

	// Just to prevent weirdness during level transition
	private var _fading:Bool;

	// Meta groups, to help speed up collisions
	private var _objects:FlxGroup;

	//HUD stuff
	private var _healthBar:FlxBar;
	private var _manaBar:FlxBar;

	//backgrounds
	private var _backgrounds:FlxTypedGroup<FlxSprite>;

	override public function create():Void
	{
		#if FLX_MOUSE
		FlxG.mouse.visible = false;
		#end

		//Set up objects
		_hud = new FlxSpriteGroup();

		//background stuff


		// Then we add the player and set up the scrolling camera,
		// which will automatically set the boundaries of the world.
		add(_player);
		
		FlxG.camera.setScrollBoundsRect(0, 0, 640, 640, true);
		FlxG.camera.follow(_player, PLATFORMER);

		add(_hud);
		//HUD
		_healthBar = new FlxBar(2, 2, FlxBarFillDirection.LEFT_TO_RIGHT, 90, 6, _sprPlayer, "health", 0, 10, true);
		_healthBar.createGradientBar([0xcc111111], [0xffff0000, 0xff00ff00], 1, 0, true, 0xcc333333);
		_healthBar.scrollFactor.set();
		add(_healthBar);
		_manaBar = new FlxBar(2, 2, FlxBarFillDirection.LEFT_TO_RIGHT, 90, 6, _sprPlayer, "mana", 0, 10, true);
		_manaBar.createGradientBar([0xcc111111], [0xffff0000, 0xff00ff00], 1, 0, true, 0xcc333333);
		_manaBar.scrollFactor.set();
		_hud.add(_healthbar);
		_hud.add(_manabar);

		// With forEach() we can execute a function on every group member
		_hud.forEach(function(s:FlxSprite)
		{
			// This makes sure the HUD does not move with the camera scroll
			s.scrollFactor.set(0, 0);
			// We only want out HUD to display on the main camera
			s.cameras = [FlxG.camera];
		});

		//mobile

		#if VIRTUAL_PAD
		add(Player.virtualPad);
		#end

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_starting)
				{
					_starting = false;
					openSubState(new MenuState());
				}

		// Escape to the main menu
		#if FLX_KEYBOARD
		if (FlxG.keys.pressed.ESCAPE)
			FlxG.switchState(new MenuState());
		#end		

	}

	private function loadMaps(): Void
	{


	}

}
