package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Shields extends FlxSprite
{

	static public var shieldLife:Int;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, shieldLife = 4)
	{
		super(X, Y, SimpleGraphic);
	}

	override public function update(elapsed)
	{
		super.update(elapsed);

		scale.set(0.8,0.8);

		

		if (shieldLife == 2)
		{
			loadGraphic(AssetPaths.Shield2__png);
		}

		if (shieldLife == 1)
		{
			loadGraphic(AssetPaths.Shield3__png);
		}

		if (shieldLife == 0)
		{
			kill();
		}

	}

}