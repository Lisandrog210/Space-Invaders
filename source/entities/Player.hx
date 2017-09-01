package entities;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite
{

	
	public function new(?x:Float=80, ?y:Float=140, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(x, y, SimpleGraphic);

		loadGraphic(AssetPaths.canon__png);
		scale.set(3, 3);

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
			var bullet:PlayerBullets = new PlayerBullets();
			bullet.x = x + 4;
			bullet.y = y - 2;
			FlxG.state.add(bullet);
		}
	}

	public function move()
	{
		if (FlxG.keys.pressed.LEFT)
			x += 2 * 60 * FlxG.elapsed;
		if (FlxG.keys.pressed.LEFT)
			x -= 2 * 60 * FlxG.elapsed;

	}
	
	

}