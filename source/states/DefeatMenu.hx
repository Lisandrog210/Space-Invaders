package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class DefeatMenu extends FlxState 
{
	private var Title:FlxText;

	override public function create():Void
	{
		Title = new FlxText(50, 54, FlxG.width, "Defeat");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
	}
	function newScore(Playerscore:Int, Playername:String)
	{
		
	}
}