package 
{
    import org.flixel.*;
 
    public class Enemy extends FlxSprite
    {
		private var sound: Class;

        public function Enemy(x: Number, y: Number, sound: Class):void
        {
            super(x, y);
            this.sound = sound;
            velocity.x = -220;
			createGraphic(20, 5, 0xffaa1111);
        }
 
        override public function update():void
        {
            super.update();
        }
        
        public function playSound(): void
        {
			FlxG.play(this.sound, 1, false);
		}
    }
}
