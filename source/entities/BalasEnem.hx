package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class BalasEnem extends FlxSprite 
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		velocity.y = 10;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
}