 package
 {
	import org.flixel.*;
 
    public class Runner extends FlxSprite
    {
		private var jumpKey:String;
		
		[Embed(source = "data/jump.mp3")] 	
		public var Jump:Class;
		
        public function Runner(y:int):void
        {
			this.x = 10;
			this.y = y;
            createGraphic(16, 13, 0xffffffff);
            this.jumpKey = "";
        }
        
        public function setJumpKey(key:String):void
        {
			this.jumpKey = key;
		}
 
        override public function update():void
        {
            maxVelocity.y = 200;
			acceleration.y = 600;
				
			if (FlxG.keys.pressed(this.jumpKey) && onFloor){
				//FlxG.play(Jump,1,false)
				velocity.y = -maxVelocity.y/2;
			}
			
            super.update();
        }
    }
 }
