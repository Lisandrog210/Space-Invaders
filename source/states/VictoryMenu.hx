package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class VictoryMenu extends FlxState
{
	private var Title:FlxText;

	override public function create():Void
	{
		Title = new FlxText(50, 54, FlxG.width, "Victory");
		Title.setFormat(null, 12, FlxColor.YELLOW);
		add(Title);

		//newScore();
	}
	function newScore()
	{
		var input = Sys.stdin().readLine();

		Sys.println("Ingrese nombre...");
		Sys.println("Hola " + input);

	}

}