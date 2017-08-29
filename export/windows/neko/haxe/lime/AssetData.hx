package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/hometown.csv", "assets/data/hometown.csv");
			type.set ("assets/data/hometown.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map.csv", "assets/data/map.csv");
			type.set ("assets/data/map.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map1.csv", "assets/data/map1.csv");
			type.set ("assets/data/map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map_bg.csv", "assets/data/map_bg.csv");
			type.set ("assets/data/map_bg.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map_deco.csv", "assets/data/map_deco.csv");
			type.set ("assets/data/map_deco.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/bg.png", "assets/images/bg.png");
			type.set ("assets/images/bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/chest.png", "assets/images/chest.png");
			type.set ("assets/images/chest.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (1).png", "assets/images/cloud (1).png");
			type.set ("assets/images/cloud (1).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (2).png", "assets/images/cloud (2).png");
			type.set ("assets/images/cloud (2).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (3).png", "assets/images/cloud (3).png");
			type.set ("assets/images/cloud (3).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (4).png", "assets/images/cloud (4).png");
			type.set ("assets/images/cloud (4).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (5).png", "assets/images/cloud (5).png");
			type.set ("assets/images/cloud (5).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (6).png", "assets/images/cloud (6).png");
			type.set ("assets/images/cloud (6).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Coin.png", "assets/images/Coin.png");
			type.set ("assets/images/Coin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Consumable.png", "assets/images/Consumable.png");
			type.set ("assets/images/Consumable.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/crate.png", "assets/images/crate.png");
			type.set ("assets/images/crate.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/dd.png", "assets/images/dd.png");
			type.set ("assets/images/dd.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fire.png", "assets/images/Fire.png");
			type.set ("assets/images/Fire.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gibs.png", "assets/images/gibs.png");
			type.set ("assets/images/gibs.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/platform.png", "assets/images/platform.png");
			type.set ("assets/images/platform.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player1.png", "assets/images/player1.png");
			type.set ("assets/images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/push.png", "assets/images/push.png");
			type.set ("assets/images/push.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sky.png", "assets/images/sky.png");
			type.set ("assets/images/sky.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile2.png", "assets/images/tile2.png");
			type.set ("assets/images/tile2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
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
			path.set ("flixel/flixel-ui/img/box.png", "flixel/flixel-ui/img/box.png");
			type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button.png", "flixel/flixel-ui/img/button.png");
			type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_down.png", "flixel/flixel-ui/img/button_arrow_down.png");
			type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_left.png", "flixel/flixel-ui/img/button_arrow_left.png");
			type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_right.png", "flixel/flixel-ui/img/button_arrow_right.png");
			type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_up.png", "flixel/flixel-ui/img/button_arrow_up.png");
			type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_thin.png", "flixel/flixel-ui/img/button_thin.png");
			type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_toggle.png", "flixel/flixel-ui/img/button_toggle.png");
			type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/check_box.png", "flixel/flixel-ui/img/check_box.png");
			type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/check_mark.png", "flixel/flixel-ui/img/check_mark.png");
			type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome.png", "flixel/flixel-ui/img/chrome.png");
			type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_flat.png", "flixel/flixel-ui/img/chrome_flat.png");
			type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_inset.png", "flixel/flixel-ui/img/chrome_inset.png");
			type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_light.png", "flixel/flixel-ui/img/chrome_light.png");
			type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/dropdown_mark.png", "flixel/flixel-ui/img/dropdown_mark.png");
			type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/finger_big.png", "flixel/flixel-ui/img/finger_big.png");
			type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/finger_small.png", "flixel/flixel-ui/img/finger_small.png");
			type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/hilight.png", "flixel/flixel-ui/img/hilight.png");
			type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/invis.png", "flixel/flixel-ui/img/invis.png");
			type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/minus_mark.png", "flixel/flixel-ui/img/minus_mark.png");
			type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/plus_mark.png", "flixel/flixel-ui/img/plus_mark.png");
			type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/radio.png", "flixel/flixel-ui/img/radio.png");
			type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/radio_dot.png", "flixel/flixel-ui/img/radio_dot.png");
			type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/swatch.png", "flixel/flixel-ui/img/swatch.png");
			type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tab.png", "flixel/flixel-ui/img/tab.png");
			type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tab_back.png", "flixel/flixel-ui/img/tab_back.png");
			type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tooltip_arrow.png", "flixel/flixel-ui/img/tooltip_arrow.png");
			type.set ("flixel/flixel-ui/img/tooltip_arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/defaults.xml", "flixel/flixel-ui/xml/defaults.xml");
			type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/default_loading_screen.xml", "flixel/flixel-ui/xml/default_loading_screen.xml");
			type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/default_popup.xml", "flixel/flixel-ui/xml/default_popup.xml");
			type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/hometown.csv", "assets/data/hometown.csv");
			type.set ("assets/data/hometown.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map.csv", "assets/data/map.csv");
			type.set ("assets/data/map.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map1.csv", "assets/data/map1.csv");
			type.set ("assets/data/map1.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map_bg.csv", "assets/data/map_bg.csv");
			type.set ("assets/data/map_bg.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map_deco.csv", "assets/data/map_deco.csv");
			type.set ("assets/data/map_deco.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/bg.png", "assets/images/bg.png");
			type.set ("assets/images/bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/chest.png", "assets/images/chest.png");
			type.set ("assets/images/chest.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (1).png", "assets/images/cloud (1).png");
			type.set ("assets/images/cloud (1).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (2).png", "assets/images/cloud (2).png");
			type.set ("assets/images/cloud (2).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (3).png", "assets/images/cloud (3).png");
			type.set ("assets/images/cloud (3).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (4).png", "assets/images/cloud (4).png");
			type.set ("assets/images/cloud (4).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (5).png", "assets/images/cloud (5).png");
			type.set ("assets/images/cloud (5).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/cloud (6).png", "assets/images/cloud (6).png");
			type.set ("assets/images/cloud (6).png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Coin.png", "assets/images/Coin.png");
			type.set ("assets/images/Coin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Consumable.png", "assets/images/Consumable.png");
			type.set ("assets/images/Consumable.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/crate.png", "assets/images/crate.png");
			type.set ("assets/images/crate.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/dd.png", "assets/images/dd.png");
			type.set ("assets/images/dd.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fire.png", "assets/images/Fire.png");
			type.set ("assets/images/Fire.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gibs.png", "assets/images/gibs.png");
			type.set ("assets/images/gibs.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/platform.png", "assets/images/platform.png");
			type.set ("assets/images/platform.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player1.png", "assets/images/player1.png");
			type.set ("assets/images/player1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/push.png", "assets/images/push.png");
			type.set ("assets/images/push.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sky.png", "assets/images/sky.png");
			type.set ("assets/images/sky.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile2.png", "assets/images/tile2.png");
			type.set ("assets/images/tile2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("Asplode", "assets/sounds/asplode.ogg");
			type.set ("Asplode", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Button", "assets/sounds/button.ogg");
			type.set ("Button", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Countdown", "assets/sounds/countdown.ogg");
			type.set ("Countdown", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Enemy", "assets/sounds/enemy.ogg");
			type.set ("Enemy", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Hit", "assets/sounds/hit.ogg");
			type.set ("Hit", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Hurt", "assets/sounds/hurt.ogg");
			type.set ("Hurt", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Jam", "assets/sounds/jam.ogg");
			type.set ("Jam", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Jet", "assets/sounds/jet.ogg");
			type.set ("Jet", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Jump", "assets/sounds/jump.ogg");
			type.set ("Jump", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("MenuHit", "assets/sounds/menu_hit.ogg");
			type.set ("MenuHit", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("MenuHit2", "assets/sounds/menu_hit_2.ogg");
			type.set ("MenuHit2", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("Mode", "assets/sounds/mode.ogg");
			type.set ("Mode", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("Shoot", "assets/sounds/shoot.ogg");
			type.set ("Shoot", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
