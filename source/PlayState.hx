package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxCamera;
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
import flixel.util.FlxPath;
using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	public static inline var TILE_SIZE:Int = 8;
	public static inline var MAP_WIDTH_IN_TILES:Int = 80;
	public static inline var MAP_HEIGHT_IN_TILES:Int = 80;


	private var _map:FlxTilemap;
	private var _deco:FlxTilemap;
	private var _bg:FlxTilemap;
 	
	

	//object storage
	private var _player:Player;
	private var sprite:FlxSprite;
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
		FlxG.state.bgColor = 0xff372215;
		_bg = new FlxTilemap();
		_bg.loadMapFromCSV("assets/data/map_bg.csv", "assets/images/sky.png", 16, 16);
		_bg.follow();
		//_bg.scrollFactor.x = _bg.scrollFactor.y = .5;
		//_bg.moves = false;
		//_bg.solid = false;
		add(_bg);
		
		
		var destination:FlxPoint;
		
		// Create the side-to-side pusher object and put it on a different path
		sprite = new FlxSprite(4304, 1872, "assets/images/platform.png");
		sprite.immovable = true;
		destination = sprite.getMidpoint();
		destination.x += 140;
		sprite.path = new FlxPath().start([sprite.getMidpoint(), destination], 40, FlxPath.YOYO);
		add(sprite);
		
		//room structures
		//hometown
		_deco = new FlxTilemap();
		_deco.loadMapFromCSV("assets/data/map_deco.csv", "assets/images/tile2.png", 16, 16);
		_deco.follow();
		add(_deco);
		_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/data/map.csv", "assets/images/tiles.png", 16, 16);
		_map.follow();
		add(_map);
		//Set up objects
		_hud = new FlxSpriteGroup();
		_healthBar = new FlxBar(2, 2, FlxBarFillDirection.LEFT_TO_RIGHT, 90, 6, _player, "health", 0, 10, true);
		_healthBar.createGradientBar([0xcc111111], [0xffff0000, 0xff00ff00], 2, 0, true, 0xcc333333);
		_healthBar.scrollFactor.set();
		add(_healthBar);
		add(_hud);

		_hud.forEach(function(s:FlxSprite)
		{
			// This makes sure the HUD does not move with the camera scroll
			s.scrollFactor.set(0, 0);
			// We only want out HUD to display on the main camera
			s.cameras = [FlxG.camera];
		});
		
		// Then add the player, its own class with its own logic
		_player = new Player(1504, 2600);
		add(_player);

		FlxG.camera.setScrollBoundsRect(0, 0, _map.width, _map.height);
		FlxG.camera.follow(_player, PLATFORMER, .5); 
		FlxG.camera.zoom = 1.3;
		FlxG.camera.targetOffset.set(0, FlxG.camera.target.height - 135);
		//FlxG.camera.antialiasing = true;
		
		#if VIRTUAL_PAD
		add(Player.virtualPad);
		#end
		
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.collide(_player, _map);
		FlxG.collide(_player, sprite);
		// Escape to the main menu
		#if FLX_KEYBOARD
		if (FlxG.keys.pressed.ESCAPE)
			FlxG.switchState(new MenuState());
		#end		

		super.update(elapsed);
	}
}