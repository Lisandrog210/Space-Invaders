package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite
{
	public var bullet(get, null):PlayerBullets;
	public var Lives:Int;
	private var Totalhealth:FlxTypedGroup<FlxSprite>;
	
	public function new(?x:Float=80, ?y:Float=140, ?SimpleGraphic:FlxGraphicAsset, ?Lives:Int)
	{
		super(x, y, SimpleGraphic);
		scale.set(1, 1);
		this.Lives  = Lives;
		bullet = new PlayerBullets(x, y, AssetPaths.bullet1__png);
		FlxG.state.add(bullet);
		bullet.kill();
		Totalhealth = new FlxTypedGroup<FlxSprite>();
		
		for (i in 0...Lives) 
		{
			var heart:FlxSprite = new FlxSprite(i*10, 2, AssetPaths.Life1__png);
			Totalhealth.add(heart);
		}
		
		FlxG.state.add(Totalhealth);
	}

	override public function update (elapsed:Float):Void
	{
		super.update(elapsed);

		move();
		shoot();
		checkBoundaries();
		
	}
	
	public function checkRevive() 
	{
		Lives--;
		if (!alive && Lives != 0) 
		{
			reset(70, 135);
			Totalhealth.members[Lives].destroy();
		}
	}

	public function checkBoundaries()
	{
		if (x<0)
			x = 0;
		if (x > 144)
			x = 144;
	}

	public function shoot()
	{
		if (FlxG.keys.justPressed.SPACE && bullet.alive==false)
		{
			bullet.reset(x - 1 + width / 2, y + height / 2 - 4);
			bullet.velocity.y = (PlayerBullets.shotVel) *-1;
			FlxG.sound.play(AssetPaths.);
		}
	}

	public function move()
	{
		if (FlxG.keys.pressed.RIGHT)
			x += 2 * 60 * FlxG.elapsed;
		if (FlxG.keys.pressed.LEFT)
			x -= 2 * 60 * FlxG.elapsed;
	}
	
	function get_bullet():PlayerBullets 
	{
		return bullet;
	}
	
	

}