package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */



class Enemies extends FlxSprite 
{
	private var OriginalX: Int;
	
	public function new(?X:Int=0, ?Y:Int=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		OriginalX = X;
		
		velocity.x = 5;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		move();
	}
	
	public function move()
	{
		if (x <= OriginalX) 
		{
			velocity.x = -velocity.x;
			y = y + 5;
		}
		if (x >= OriginalX + 22) 
		{
			velocity.x = -velocity.x;
			y = y + 5;
		}
	}
	
}