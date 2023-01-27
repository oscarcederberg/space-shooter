package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Bullet extends FlxSprite {
    public var speed:Float;
    public var damage:Float;

    public function new(x:Float, y:Float, speed:Float, damage:Float) {
        super(x,y);

        this.speed = speed;
        this.damage = damage;
        this.velocity.x = speed;

        loadGraphic("assets/images/bullets/default.png", true, 3, 3);
    }

	override public function update(elapsed:Float) {
        if (x > (6 / 5) * FlxG.width) {
            this.kill();
        }

        super.update(elapsed);
    }
}