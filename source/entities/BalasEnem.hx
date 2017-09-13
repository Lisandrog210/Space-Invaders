package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class BalasEnem extends FlxSprite 
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);		
		scale.set(0.3,0.3);
		velocity.y = 10;
		updateHitbox();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
}