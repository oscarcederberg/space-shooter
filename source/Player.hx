package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;

class Player extends FlxSprite {
    private static var SPEED:Float = 125;
    private static var SPEED_SHOOTING_COEFF:Float = 0.6;

    public var weapon:Weapon;

    public function new(x:Float, y:Float) {
        super(x, y);

        this.weapon = new Weapon();

        loadGraphic("assets/images/player.png", true, 48, 48);
        animation.add("normal", [0, 1], 3, true);
        animation.play("normal");

        drag.x = drag.y = 400;
    }

    override public function update(elapsed:Float):Void {
        handleInput();

        weapon.update(elapsed);
        super.update(elapsed);

        x = FlxMath.bound(x, 0, FlxG.width / 3 - this.width);
        y = FlxMath.bound(y, HUD.BAR_HEIGHT, FlxG.height - HUD.BAR_HEIGHT - this.height);
        weapon.x = x;
        weapon.y = y;
    }

    function handleInput():Void {
        var up = FlxG.keys.anyPressed([UP, W]);
        var down = FlxG.keys.anyPressed([DOWN, S]);
        var left = FlxG.keys.anyPressed([LEFT, A]);
        var right = FlxG.keys.anyPressed([RIGHT, D]);
        var primary = FlxG.keys.anyPressed([SPACE, J]);

        if (up && down)
            up = down = false;
        if (left && right)
            left = right = false;

        if (up || down || left || right) {
            var degrees:Float = 0;
            if (up) {
                degrees = -90;
                if (left)
                    degrees -= 45;
                else if (right)
                    degrees += 45;
            } else if (down) {
                degrees = 90;
                if (left)
                    degrees += 45;
                else if (right)
                    degrees -= 45;
            } else if (left) {
                degrees = 180;
            } else if (right) {
                degrees = 0;
            }

            if (!primary) {
                velocity.setPolarDegrees(SPEED, degrees);
            } else {
                velocity.setPolarDegrees(SPEED_SHOOTING_COEFF * SPEED, degrees);
            }
        }

        if (primary) {
            weapon.shoot();
        }
    }
}