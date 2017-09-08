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
	private var Bullet: BalasEnem;
	
	public function new(?X:Int=0, ?Y:Int=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		scale.set(0.5, 0.5);
		
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
		if (x >= OriginalX + 10) 
		{
			velocity.x = -velocity.x;
			y = y + 5;
		}
	}
	
	public function shoot()
	{
		Bullet = new BalasEnem(x - 2 + width / 2, y + height / 2, AssetPaths.bullet1__png);
		Bullet.velocity.y = 10;
		FlxG.state.add(Bullet);
	}
	
}