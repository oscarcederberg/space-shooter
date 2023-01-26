package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player:Player;
	var starGenerator:StarGenerator;
	var hud:HUD;

	override public function create()
	{
		super.create();

		FlxG.camera.bgColor.setRGB(20, 20, 40);

		player = new Player(64, 0);
		player.screenCenter(Y);

		starGenerator = new StarGenerator(25, 5);

		hud = new HUD();

		add(starGenerator.particles);
		add(player);
		add(hud.elements);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		player.update(elapsed);
		starGenerator.particles.update(elapsed);
		hud.elements.update(elapsed);
	}
}
