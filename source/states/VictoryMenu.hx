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
	private var Text:FlxText;
	private var Text2: FlxText;

	override public function create():Void
	{
		Title = new FlxText(50, 20, FlxG.width, "Victory");
		Title.setFormat(null, 12, FlxColor.YELLOW);
		add(Title);
		FlxG.sound.play(AssetPaths.victoyryguitar__wav);

		//newScore();
		
		Text = new FlxText(15, 50, FlxG.width, "Press 'Space' to menu");
		add(Text);
		
		Text2 = new FlxText(15, 70, FlxG.width, "press 'R' to restart");
		add(Text2);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new Menu());
		}
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new PlayState());
		}
	}
	

}