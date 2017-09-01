package states;

import flixel.FlxState;
import entities.Enemies;
import entities.Player;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;


class PlayState extends FlxState
{
	private var player1:Player;
	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		player1 = new Player (68, 138);
		
		add(player1);		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}