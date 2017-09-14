package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.Menu;
import states.PlayState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(160, 144, Menu, 4, 60, 60, true));
	}
}