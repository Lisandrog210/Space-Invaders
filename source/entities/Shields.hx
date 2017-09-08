package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Shields extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);		
	}
	
	override public function update(elapsed)
	{
		super.update(elapsed);
		
		scale.set(0.8,0.8);

		/*if (/*if de colision de disparo de disparos de enemigos))*/
		

	}
	
}