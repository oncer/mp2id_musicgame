package 
{
    import org.flixel.*;
 
    public class Enemy extends FlxSprite
    {
 
        public function Enemy(x: Number, y: Number):void
        {
            super(x, y);
            velocity.x = -40;
			createGraphic(20, 5, 0xffaa1111);
        }
 
        override public function update():void
        {
            super.update();
        }
    }
}