package states;

import entities.Shields;
import entities.BalasEnem;
import flixel.FlxState;
import entities.Enemies;
import entities.Player;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.Ufo;

class PlayState extends FlxState
{
	private var enemigo:Enemies;
	private var GrupoEne:FlxTypedGroup<Enemies>;
	private var player1:Player;
	private var orientacion:Bool;
	private var FilaEntera:Int = 0;
	private var GrupoDspEne:FlxTypedGroup<BalasEnem>;
	private var Randm: Int;
	private var RandomUfo:Int;
	private var Timer: Float = 0;

	private var shield1:Shields;
	private var shield2:Shields;
	private var shield3:Shields;
	private var shield4:Shields;
	public var ufo1(get, null):Ufo;

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

		ufo1 = new Ufo (140, 0, AssetPaths.ufo__png);
		FlxG.state.add(ufo1);
		ufo1.kill();

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
		UfoCreate();
		ufoCollision();
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

	function UfoCreate()
	{
		if (ufo1.alive==false)
		{
			var Random = new FlxRandom();
			RandomUfo = Random.int(0, 160);

			if (RandomUfo==5)
			{
				ufo1.reset(140,0);
				add(ufo1);
			}
		}
	}

	function ufoCollision()
	{
		if (FlxG.overlap(ufo1,player1.bullet)) 
		{
			ufo1.kill();
		}
	}
	
	function get_ufo1():Ufo 
	{
		return ufo1;
	}
}