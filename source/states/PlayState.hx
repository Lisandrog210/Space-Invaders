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
	public var ufo1(get, null):Ufo;
	public var GrupoShields:FlxTypedGroup<Shields>;
	public var collide2:Bool;

	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;

		player1 = new Player (10, 135, AssetPaths.canon__png);
		add(player1);

		ufo1 = new Ufo (140, 0, AssetPaths.nave_extra__png);
		FlxG.state.add(ufo1);
		ufo1.kill();

		GrupoEne = new FlxTypedGroup<Enemies>();
		GrupoShields = new FlxTypedGroup<Shields>();

		for (j in 0...4)
		{
			var shield:Shields = new Shields(j*40+5, 120, AssetPaths.Shield1__png,4);
			GrupoShields.add(shield);
		}
		add(GrupoShields);

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

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Tiempo(elapsed);
		collision();
		UfoCreate();
		ufoCollision();
		collisionEnemBulletyPlayer();
		collisionEnemBulletyShield();
		collisionEnemiesShield();
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

	function collisionEnemBulletyPlayer():Void
	{
		for (j	in 0...GrupoEne.length)
		{
			if (GrupoEne.members[j].Bullet1 != null)
			{
				if (FlxG.overlap(GrupoEne.members[j].Bullet1,player1))
				{
					player1.kill();
					GrupoEne.members[j].Bullet1.kill();
				}
			}

		}
	}

	function collisionEnemBulletyShield():Void //no funca o no funca el update del shield q le cambia el sprite
	{
		for (j	in 0...GrupoEne.length)
		{
			if (GrupoEne.members[j].Bullet1 != null)
			{
				if (FlxG.overlap(GrupoEne.members[j].Bullet1,GrupoShields.members[j]))
				{
					Shields.shieldLife - 1;
					GrupoEne.members[j].Bullet1.kill();

				}
			}

		}
	}

	function collisionEnemiesShield():Void //no funca o no funca el update del shield q le cambia el sprite
	{
		for (j	in 0...GrupoEne.length)
		{

			if (FlxG.overlap(GrupoEne.members[j],GrupoShields.members[j]))
			{
				Shields.shieldLife - 1;
				GrupoEne.members[j].kill();

			}

		}
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
			RandomUfo = Random.int(0, 300);

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