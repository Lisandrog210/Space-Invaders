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
	private var Title: FlxText;
	private var Text: FlxText;

	override public function create():Void
	{
		super.create();
		
		Title = new FlxText(20, 5, FlxG.width, "Space Invaders");
		Title.setFormat(null, 12, FlxColor.RED);
		add(Title);
		
		Text = new FlxText(15, 50, FlxG.width, "Press 'Space' to continue");
		add(Text);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.SPACE) 
		{
			ClickPlay();
		}
	}
	
	function ClickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}