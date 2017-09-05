package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite
{

	public function new(?x:Float=80, ?y:Float=140, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(x, y, SimpleGraphic);
		scale.set(1, 1);

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

		if (FlxG.keys.justPressed.SPACE)
		{
			bullet.isOnScreen(?Camera:FlxCamera):Bool
			var bullet:PlayerBullets = new PlayerBullets(x, y, AssetPaths.bullet1__png);

			bullet.x = x - 2 + width / 2;
			bullet.y = y + height / 2;			
			FlxG.state.add(bullet);

		}

	}

	public function move()
	{
		if (FlxG.keys.pressed.RIGHT)
			x += 2 * 60 * FlxG.elapsed;
		if (FlxG.keys.pressed.LEFT)
			x -= 2 * 60 * FlxG.elapsed;

	}

}