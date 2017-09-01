package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player 
{

	public function new(X:Float=80, Y:Float=140, Cannon:FlxGraphicAsset) 
	{
		super(X, Y, Cannon);
		
		loadPng(AssetPaths.cañon_png);
		scale.set(3, 3);
		
	}
	
	
	override public function update (elapsed:Float):Void
	{
		super.update(elapsed);
		
		move();
	}
	
	public function move()
	{
		if (FlxG.keys.pressed.
		
	}
	
}