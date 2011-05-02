package {
	import org.flixel.*;
	
	public class Obstacle extends FlxSprite
	{
		protected var level:Level;
		protected var start_x:Number; // absolute X value
		
		public function Obstacle(LEVEL:Level, X:Number, Y:Number)
		{
			this.level = LEVEL;
			this.x = this.start_x = X;
			this.y = Y;
		}
		
		override public function update():void
		{
			this.x = this.start_x - level.xpos;
			
			super.update();
		}
	}
}
