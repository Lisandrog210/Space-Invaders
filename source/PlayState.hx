package;

import entities.Enemies;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	var enemigo:Enemies;
	var GrupoEne:FlxTypedGroup<Enemies>;
	
	override public function create():Void
	{
		super.create();
		
		GrupoEne = new FlxTypedGroup<Enemies>();
		
		for (i in 0...5) 
		{
			var enem: Enemies = new Enemies(i*20, 0, AssetPaths.nave1__png);
			add(enem);
		}
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}