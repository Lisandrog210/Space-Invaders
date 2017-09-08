package states;

import entities.Shields;
import entities.BalasEnem;
import flixel.FlxState;
import entities.Enemies;
import entities.Player;
import flixel.FlxState;
import flixel.FlxG;
import flixel.math.FlxRandom;
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
  	private var Randm: Int;
	private var Timer: Float = 0;
	private var shield1:Shields;
	private var shield2:Shields;
	private var shield3:Shields;
	private var shield4:Shields;

	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;

		player1 = new Player (10, 135, AssetPaths.canon__png);   
		add(player1);   

		shield1 = new Shields (1, 120, AssetPaths.Shield1__png);
		add(shield1);

		shield2 = new Shields (40, 120, AssetPaths.Shield1__png);
		add(shield2);

		shield3 = new Shields (80, 120, AssetPaths.Shield1__png);
		add(shield3);

		shield4 = new Shields (120, 120, AssetPaths.Shield1__png);
		add(shield4);

		GrupoEne = new FlxTypedGroup<Enemies>();
		
     
		for (i in 0...10)
		{
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 20, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 30, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 40, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 50, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 60, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 6)
			{
				var enem: Enemies = new Enemies(i*15, 70, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
		}
		add(GrupoEne);
	}
	function collision():Void
	{
		for (i in 0...GrupoEne.members.length) 
		{
			if (FlxG.overlap(GrupoEne.members[i], player1.bullet))
			{
				GrupoEne.remove(GrupoEne.members[i], true);
				player1.bullet.kill();
			}
		}
		if (FlxG.overlap(GrupoEne,player1)) 
		{
			player1.kill();
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Tiempo(elapsed);
		collision();

	}
	
	function Tiempo(elapsed) 
	{
		Timer = Timer + elapsed;
		
		if (Timer > 2) 
		{
			EnemyShoot();
			Timer = 0;
		}
	}
	
	function EnemyShoot() 
	{
		var Random = new FlxRandom();
		Randm = Random.int(0, GrupoEne.length - 1);
		GrupoEne.members[Randm].shoot();
	}
}