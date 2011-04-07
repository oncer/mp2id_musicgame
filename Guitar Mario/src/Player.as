package
{
    import org.flixel.*;
 
    public class Player extends FlxSprite
    {
		private var player:Class;
		
		[Embed(source = "data/jump.mp3")] 	
		public var Jump:Class;
		
        public function Player():void
        {
			x = 10;
			y = 27;
            createGraphic(16, 13, 0xffffffff);
        }
 
        override public function update():void
        {
            maxVelocity.y = 200;
			acceleration.y = 200;
				
			if (FlxG.keys.SPACE && onFloor){
				FlxG.play(Jump,1,false)
				velocity.y = -maxVelocity.y/2;
			}
			
			if (FlxG.keys.ONE){
				x = 10;
				y = 27;
			}
			
			if (FlxG.keys.TWO){
				x = 10;
				y = 99;
			}
			
			if (FlxG.keys.THREE){
				x = 10;
				y = 171;
			}	
            super.update();
        }
    }
}