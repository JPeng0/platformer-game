package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level1.csv", "assets/data/level1.csv");
			type.set ("assets/data/level1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level1.oel", "assets/data/level1.oel");
			type.set ("assets/data/level1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map.oep", "assets/data/map.oep");
			type.set ("assets/data/map.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/asplode.mp3", "assets/sounds/asplode.mp3");
			type.set ("assets/sounds/asplode.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/asplode.ogg", "assets/sounds/asplode.ogg");
			type.set ("assets/sounds/asplode.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/button.mp3", "assets/sounds/button.mp3");
			type.set ("assets/sounds/button.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/button.ogg", "assets/sounds/button.ogg");
			type.set ("assets/sounds/button.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/countdown.mp3", "assets/sounds/countdown.mp3");
			type.set ("assets/sounds/countdown.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/countdown.ogg", "assets/sounds/countdown.ogg");
			type.set ("assets/sounds/countdown.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/enemy.mp3", "assets/sounds/enemy.mp3");
			type.set ("assets/sounds/enemy.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/enemy.ogg", "assets/sounds/enemy.ogg");
			type.set ("assets/sounds/enemy.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/hit.mp3", "assets/sounds/hit.mp3");
			type.set ("assets/sounds/hit.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/hit.ogg", "assets/sounds/hit.ogg");
			type.set ("assets/sounds/hit.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/hurt.mp3", "assets/sounds/hurt.mp3");
			type.set ("assets/sounds/hurt.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/hurt.ogg", "assets/sounds/hurt.ogg");
			type.set ("assets/sounds/hurt.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jam.mp3", "assets/sounds/jam.mp3");
			type.set ("assets/sounds/jam.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/jam.ogg", "assets/sounds/jam.ogg");
			type.set ("assets/sounds/jam.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jet.mp3", "assets/sounds/jet.mp3");
			type.set ("assets/sounds/jet.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/jet.ogg", "assets/sounds/jet.ogg");
			type.set ("assets/sounds/jet.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/jump.mp3", "assets/sounds/jump.mp3");
			type.set ("assets/sounds/jump.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/jump.ogg", "assets/sounds/jump.ogg");
			type.set ("assets/sounds/jump.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/menu_hit.mp3", "assets/sounds/menu_hit.mp3");
			type.set ("assets/sounds/menu_hit.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/menu_hit.ogg", "assets/sounds/menu_hit.ogg");
			type.set ("assets/sounds/menu_hit.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/menu_hit_2.mp3", "assets/sounds/menu_hit_2.mp3");
			type.set ("assets/sounds/menu_hit_2.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/menu_hit_2.ogg", "assets/sounds/menu_hit_2.ogg");
			type.set ("assets/sounds/menu_hit_2.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/mode.mp3", "assets/sounds/mode.mp3");
			type.set ("assets/sounds/mode.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/mode.ogg", "assets/sounds/mode.ogg");
			type.set ("assets/sounds/mode.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/shoot.mp3", "assets/sounds/shoot.mp3");
			type.set ("assets/sounds/shoot.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/shoot.ogg", "assets/sounds/shoot.ogg");
			type.set ("assets/sounds/shoot.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
