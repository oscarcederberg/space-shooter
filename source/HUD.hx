package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;

class HUD {
    public static var BAR_HEIGHT:Int = 48;

    public var elements:FlxGroup;

    var upperBar:FlxSprite;
    var lowerBar:FlxSprite;

    public function new() {
        this.elements = new FlxGroup();

        this.upperBar = new FlxSprite(0, 0);
        this.upperBar.makeGraphic(FlxG.width, BAR_HEIGHT, FlxColor.BLACK);
        this.lowerBar = new FlxSprite(0, FlxG.height - BAR_HEIGHT);
        this.lowerBar.makeGraphic(FlxG.width, BAR_HEIGHT, FlxColor.BLACK);
        this.elements.add(upperBar);
        this.elements.add(lowerBar);
    }
}