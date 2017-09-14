package states;

import entities.Shields;
import entities.BalasEnem;
import flash.display.Sprite;
import flixel.FlxState;
import entities.Enemies;
import entities.Player;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.Ufo;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

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
	private var score:String;
	public  var life1:FlxSprite;
	public  var life2:FlxSprite;
	public  var life3:FlxSprite;

	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;

		var life1 = new FlxSprite (2, 2, AssetPaths.life__png);
		var life2 = new FlxSprite (12, 2, AssetPaths.life__png);
		var life3 = new FlxSprite (22, 2, AssetPaths.life__png);
		add(life1);
		add(life2);
		add(life3);

		player1 = new Player (10, 135, AssetPaths.canon__png,3);
		add(player1);

		ufo1 = new Ufo (140, 0, AssetPaths.nave_extra__png);
		FlxG.state.add(ufo1);
		ufo1.kill();

		GrupoEne = new FlxTypedGroup<Enemies>();
		GrupoShields = new FlxTypedGroup<Shields>();

		for (j in 0...4)
		{
			var shield:Shields = new Shields(j*35+18, 120, AssetPaths.Shield1__png,3);
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
		collisionPlayerBulletShield();
		collisionPlayerBulletEnemyBullet();
		removeLife();
	}

	public function removeLife()
	{
		if (player1.Lives==2)
		{
			life1.destroy();
		}
		else if (player1.Lives==1)
		{
			life2.destroy();
		}
		else if (player1.Lives==0)
		{
			life3.destroy();
		}
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
			player1.checkRevive();

		}
	}

	function collisionEnemBulletyPlayer():Void
	{
		for (i	in 0...GrupoEne.length)
		{
			if (GrupoEne.members[i].Bullet1 != null)
			{
				if (FlxG.overlap(GrupoEne.members[i].Bullet1,player1))
				{
					player1.kill();
					GrupoEne.members[i].Bullet1.kill();
					player1.checkRevive();
				}
			}
		}
	}

	function collisionEnemBulletyShield():Void
	{
		for (i	in 0...GrupoEne.length)
		{
			if (GrupoEne.members[i].Bullet1 != null)
			{
				for (j in 0...GrupoShields.length)
				{
					if (FlxG.overlap(GrupoEne.members[i].Bullet1,GrupoShields.members[j]))
					{
						GrupoShields.members[j].shieldChange();
						GrupoEne.members[i].Bullet1.kill();
					}
				}
			}
		}
	}

	function collisionEnemiesShield():Void
	{
		for (i	in 0...GrupoEne.length)
		{
			for (j in 0...GrupoShields.length)
			{
				if (FlxG.overlap(GrupoEne.members[i],GrupoShields.members[j]))
				{
					GrupoShields.members[j].shieldChange();
					GrupoEne.members[i].kill();
				}
			}
		}
	}

	function collisionPlayerBulletShield():Void
	{
		for (i in 0...GrupoShields.length)
		{
			if (FlxG.overlap(player1.bullet, GrupoShields.members[i]))
			{
				GrupoShields.members[i].shieldChange();
				player1.bullet.kill();
			}
		}
	}

	function collisionPlayerBulletEnemyBullet():Void
	{
		for (i in 0...GrupoEne.length)
		{
			if (FlxG.overlap(player1.bullet, GrupoEne.members[i].Bullet1))
			{
				GrupoEne.members[i].Bullet1.kill();
				player1.bullet.kill();
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
		if (GrupoEne.length != 0)
		{
			var Random = new FlxRandom();
			Randm = Random.int(0, GrupoEne.length - 1);
			GrupoEne.members[Randm].shoot();
		}
	}

	function UfoCreate()
	{
		if (ufo1.alive==false)
		{
			var Random = new FlxRandom();
			RandomUfo = Random.int(0, 300);

			if (RandomUfo==5)
			{
				ufo1.reset(140,8);
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