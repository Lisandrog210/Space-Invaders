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
	private var enemigo:Enemies; 
	private var GrupoEne:FlxTypedGroup<Enemies>;
	private var player1:Player;
	
	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		player1 = new Player (10, 120, AssetPaths.canon__png);
		
		add(player1);
		
		GrupoEne = new FlxTypedGroup<Enemies>(); 
     
		for (i in 0...5)  
		{ 
			var enem: Enemies = new Enemies(i*20, 0, AssetPaths.nave1__png); 
			add(enem); 
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}