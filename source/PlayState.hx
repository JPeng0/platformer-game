package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.input.touch.FlxTouch;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	public static inline var TILE_SIZE:Int = 8;
	public static inline var MAP_WIDTH_IN_TILES:Int = 80;
	public static inline var MAP_HEIGHT_IN_TILES:Int = 80;


	private var _map:FlxTilemap;
 	//private var _mWalls:FlxTilemap;
	private var _starting:Bool = true;
	private var _launchedSubstate:Bool = false;

	//object storage
	private var _player:Player;

	// Just to prevent weirdness during level transition
	private var _fading:Bool;

	// Meta groups, to help speed up collisions
	private var _objects:FlxGroup;

	//HUD stuff
	private var _hud:FlxSpriteGroup;
	private var _healthBar:FlxBar;
	private var _manaBar:FlxBar;

	//backgrounds
	private var _backgrounds:FlxTypedGroup<FlxSprite>;
	//private var _map:FlxTilemap;

	override public function create():Void
	{
		#if FLX_MOUSE
		FlxG.mouse.visible = false;
		#end
		
		// Background
		FlxG.state.bgColor = 0xffacbcd7;
		var decoration:FlxSprite = new FlxSprite(256, 159, "assets/images/bg.png");
		decoration.moves = false;
		decoration.solid = false;
		add(decoration);
		
		var sprite:FlxSprite;
		var destination:FlxPoint;
		
		
		// Then add the player, its own class with its own logic
		var player:Player = new Player(32, 100);
		add(player);
		
		FlxG.camera.setScrollBoundsRect(0, 0, 640, 480, true);
		FlxG.camera.follow(player, PLATFORMER);
		
		// Basic level structure
		_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/data/level1.csv", "assets/images/tiles.png", 16, 16);
		_map.follow();
		add(_map);

		//Set up objects
		_hud = new FlxSpriteGroup();

		add(_hud);
		_hud.forEach(function(s:FlxSprite)
		{
			// This makes sure the HUD does not move with the camera scroll
			s.scrollFactor.set(0, 0);
			// We only want out HUD to display on the main camera
			s.cameras = [FlxG.camera];
		});

		#if VIRTUAL_PAD
		add(Player.virtualPad);
		#end
		
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.collide();

		/*if (_starting)
		{
			if (!_launchedSubstate)
			{
				_launchedSubstate = true;
				_starting = false;
				FlxG.switchState(new PlayState());
			}
		}
		*/
		// Escape to the main menu
		#if FLX_KEYBOARD
		if (FlxG.keys.pressed.ESCAPE)
			FlxG.switchState(new MenuState());
		#end		

		super.update(elapsed);
	}
}