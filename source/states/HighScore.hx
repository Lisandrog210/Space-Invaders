package states;

import entities.Score;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class HighScore extends FlxState 
{
	private var Title: FlxText;
	private var Scores:FlxTypedGroup<Score>;
	private var y:Int = 15;
	
	override public function create():Void
	{
		Title = new FlxText(5, 5, FlxG.width, "HighScores");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
		
		Scores = new FlxTypedGroup<Score>();
		add(Scores);
	}
	
	
	
}