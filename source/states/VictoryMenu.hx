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
		Title = new FlxText(5, 5, FlxG.width, "Victory");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
		
		newScore();
	}
	function newScore()
	{
		
	}
	
}