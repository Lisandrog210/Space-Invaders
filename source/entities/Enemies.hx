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
	private var vel:Float = 0.25;
	private var direccion: Int = 1;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		move();
	}
	
	public function move()
	{
		while (y < FlxG.height && x >= 0) 
		{
			x = x + vel * direccion;
			
			if (x >= FlxG.width || x <= 0)
			{
				y = y + 15;
				direccion = direccion * -1;
			}
			break;
		}
		
		
		
		
	}
	
}