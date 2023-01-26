package;

import flixel.FlxSprite;
import flixel.FlxObject;

enum StarType {
    SMALL;
    MEDIUM;
    BIG;
}

class Star extends FlxSprite {
    private var speed:Float;

    public function new(x:Float, y:Float, speed:Float, type:StarType) {
        super(x, y);

        velocity.x = -speed;

        if (type == SMALL) {
            loadGraphic("assets/images/stars/small.png", true, 3, 3);
        } else if (type == MEDIUM) {
            loadGraphic("assets/images/stars/medium.png", true, 6, 6);
        } else {
            loadGraphic("assets/images/stars/big.png", true, 9, 9);
        }
    }

    override public function update(elapsed:Float):Void {
        if (x < -64 - this.width) {
            super.kill();
        }

        super.update(elapsed);
    }
}