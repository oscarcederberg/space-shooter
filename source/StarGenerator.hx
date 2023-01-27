package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;

class StarGenerator {
	public var particles:FlxTypedGroup<Star>;

    var max:Int;
    var timer:FlxTimer;
    var freq:Float;

    public function new(max:Int, frequency:Float) {
		this.particles = new FlxTypedGroup(max);

		this.max = max;
        this.freq = frequency;
        this.timer = new FlxTimer();

        this.timer.start(1 / freq, addStar, 0);

		for (i in 0...max) {
			particles.add(
				createStar(Math.random() * 1.5 * FlxG.width, Math.random() * FlxG.height)
			);
		}
    }

	public function update(elapsed:Float) {
		particles.update(elapsed);
	}

    function addStar(timer:FlxTimer):Void {
		if(particles.countDead() > 1) {
			particles.replace(particles.getFirstAvailable(),
                createStar(FlxG.width + Math.random() * 50, Math.random() * FlxG.height)
            );
        }
	}

    function createStar(x:Float, y:Float):Star {
		var random:Float = Math.random() * 100;
		var speed:Float;

		if(random < 50) {
			speed = 50 + Math.random() * 100;
			return new Star(x, y, speed, SMALL);
		}
		else if(random < 90) {
			speed = 50 + Math.random() * 150;
			return new Star(x, y, speed, MEDIUM);
		}
		else {
			speed = 100 + Math.random() * 200;
			return new Star(x, y, speed, BIG);
		}
	}
}