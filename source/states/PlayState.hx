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
	private var GrupoDspEne:FlxTypedGroup<BalasEnem>;
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

		player1 = new Player (10, 120, AssetPaths.canon__png);
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
		GrupoDspEne = new FlxTypedGroup<BalasEnem>();
		
		for (j in 0...4) 
		{
			var BalasEn = new BalasEnem();
			GrupoDspEne.add(BalasEn);
		}
     
		for (i in 0...7)
		{
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 0, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 15, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 30, AssetPaths.nave1__png);
				GrupoEne.add(enem);
				FilaEntera+1;
			}
			if (FilaEntera < 4)
			{
				var enem: Enemies = new Enemies(i*20, 45, AssetPaths.nave1__png);
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
		Randm = Random.int(0, 27);
		GrupoEne.members[Randm].shoot();
	}
}