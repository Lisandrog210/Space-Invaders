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
	private var orientacion:Bool;
	private var FilaEntera:Int = 0;
	
	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		player1 = new Player (10, 120, AssetPaths.canon__png);
		
		add(player1);
		
		GrupoEne = new FlxTypedGroup<Enemies>();
     
		for (i in 0...7)
		{ 
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 0, AssetPaths.nave1__png); 
				add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 15, AssetPaths.nave1__png); 
				add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 30, AssetPaths.nave1__png); 
				add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 45, AssetPaths.nave1__png); 
				add(enem);
				FilaEntera+1;
			}
			
		}
		
		add(GrupoEne);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}