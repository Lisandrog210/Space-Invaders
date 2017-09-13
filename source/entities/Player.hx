package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite
{
	public var bullet(get, null):PlayerBullets;	
	
	public function new(?x:Float=80, ?y:Float=140, ?SimpleGraphic:FlxGraphicAsset, ?Lives:Int)
	{
		super(x, y, SimpleGraphic);
		scale.set(1, 1);
		
		bullet = new PlayerBullets(x, y, AssetPaths.bullet1__png);
		FlxG.state.add(bullet);
		bullet.kill();
	}

	override public function update (elapsed:Float):Void
	{
		super.update(elapsed);

		move();
		shoot();
		checkBoundaries();
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
			bullet.velocity.y = (PlayerBullets.shotVel)*-1;
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