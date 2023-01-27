package;

import flixel.FlxSprite;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

class Weapon extends FlxSprite {
    public var bullets:FlxTypedGroup<Bullet>;

    private var canShoot:Bool;
    private var timer:FlxTimer;

    public function new() {
        super(x, y);
        this.bullets = new FlxTypedGroup<Bullet>();
        this.canShoot = true;
        this.timer = new FlxTimer();

        loadGraphic("assets/images/weapons/default.png", true, 48, 48);
        animation.add("shooting", [1, 2, 0], 3, false);
    }

	override public function update(elapsed:Float) {
        bullets.update(elapsed);
        super.update(elapsed);
    }

    public function shoot():Void {
        if(canShoot) {
            animation.play("shooting", true);
            canShoot = false;
            var bullet:Bullet = new Bullet(x + 30, y + 33, 100, 10);
            bullets.add(bullet);
            timer.start(1 / 6, _ -> canShoot = true, 1);
        }
    }
}