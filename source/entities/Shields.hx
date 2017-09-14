package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Shields extends FlxSprite
{

	private var shieldLife:Int;
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset, ?shieldLife:Int)
	{
		super(X, Y, SimpleGraphic);
		
		this.shieldLife  = shieldLife;
		
		scale.set(0.5, 0.5);
		updateHitbox();
	}

	override public function update(elapsed)
	{
		super.update(elapsed);

	}
	
	public function shieldChange() 
	{
		shieldLife--;
		if (shieldLife == 2)
		{	
			loadGraphic(AssetPaths.Shield2__png);
			updateHitbox();

		}

		else if (shieldLife == 1)
		{
			loadGraphic(AssetPaths.Shield3__png);
			updateHitbox();
		}

		else if (shieldLife == 0)
		{
			kill();
		}
	}

}