package 
{
    import org.flixel.*;
 
    public class Enemy extends FlxSprite
    {
		public static var SPEED: Number = 160;
		private var sound: FlxSound;

        public function Enemy(x: Number, y: Number, sound: FlxSound):void
        {
            super(x, y);
            this.sound = sound;
            velocity.x = -SPEED;
			createGraphic(20, 5, 0xffaa1111);
        }
 
        override public function update():void
        {
            super.update();
        }
        
        public function playSound(): void
        {
			this.sound.stop();
			this.sound.play(50);
		}
    }
}
