package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
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


	private var _map:FlxOgmoLoader;
 	private var _mWalls:FlxTilemap;
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

		//Set up objects
		_hud = new FlxSpriteGroup();

		//background stuff
		FlxG.state.bgColor = 0xffacbcd7;
		_backgrounds = new FlxTypedGroup<FlxSprite>();
		//_backgrounds.moves = false;
		//_backgrounds.solid = false;
		_map = new FlxOgmoLoader("assets/data/level1.oel");
		_mWalls = _map.loadTilemap("assets/images/tiles.png", 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		
		add(_backgrounds);

		//map stuff
		/*_map = new FlxTilemap();
		_map.allowCollisions = FlxObject.ANY;
		add(_map.loadMapFromCSV("assets/data/level1.csv", "assets/images/tiles.png", 16, 16));
		*/
		// Then we add the player and set up the scrolling camera,
		// which will automatically set the boundaries of the world.
		_player = new Player(32,148);
 		//_map.loadEntities(placeEntities, "entities");
		add(_player);

		FlxG.camera.setScrollBoundsRect(0, 0, 640, 640, true);
		FlxG.camera.follow(_player, PLATFORMER);

		add(_hud);
		//HUD
		_healthBar = new FlxBar(2, 2, FlxBarFillDirection.LEFT_TO_RIGHT, 90, 6, _player, "health", 0, 10, true);
		_healthBar.createGradientBar([0xcc111111], [0xffff0000, 0xff00ff00], 1, 0, true, 0xcc333333);
		_healthBar.scrollFactor.set();
		//add(_healthBar);
		_manaBar = new FlxBar(2, 2, FlxBarFillDirection.LEFT_TO_RIGHT, 90, 6, _player, "mana", 0, 10, true);
		_manaBar.createGradientBar([0xcc111111], [0xffff0000, 0xff00ff00], 1, 0, true, 0xcc333333);
		_manaBar.scrollFactor.set();
		_hud.add(_healthBar);
		_hud.add(_manaBar);

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

		//collisions
		FlxG.collide(_player, _mWalls);
	}

	//private function loadMaps(): Void
	//{


	//}

	private function placeEntities(entityName:String, entityData:Xml):Void
 	{
	     var x:Int = Std.parseInt(entityData.get("x"));
	     var y:Int = Std.parseInt(entityData.get("y"));
	     if (entityName == "player")
	     {
	         _player.x = x;
	         _player.y = y;
	     }
 	}	
}	
