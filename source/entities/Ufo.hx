package entities;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

class Ufo extends FlxSprite
{

	public function new(?X:Float=140, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		scale.set(0.5,0.5);
		updateHitbox();
	}
	
	override public function update(elapsed)
	{
		super.update(elapsed);
		
		move();
		checkBoundaries2();
		
	}
	
	public function checkBoundaries2()
	{
		if (x<0)
		{
			kill();
		}
	}
	
	public function move()
	{
		x -= 2 * 10 * FlxG.elapsed;
	}
}