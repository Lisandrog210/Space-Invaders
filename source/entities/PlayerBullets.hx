package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PlayerBullets extends FlxSprite
{

	static public var shotVel:Float = 300;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);

		scale.set(0.5, 0.5);
		velocity.y = -shotVel;
	}

	override public function update(elapsed)
	{
		super.update(elapsed);

		if (y < 0)
			kill();
	}

}