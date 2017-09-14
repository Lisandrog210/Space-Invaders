package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Menu extends FlxState 
{
	private var PlayButton:FlxButton;
	private var ScoreButton:FlxButton;
	private var Title: FlxText;

	override public function create():Void
	{
		super.create();
		
		Title = new FlxText(20, 5, FlxG.width, "Space Invaders");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
		
		PlayButton = new FlxButton(38, 40, "Play", ClickPlay);
		add(PlayButton);
		
		ScoreButton = new FlxButton(38, 80, " HighScore", clickScore);
		add(ScoreButton);
	}
	
	function clickScore() 
	{
		FlxG.switchState(new HighScore());
	}
	
	function ClickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}