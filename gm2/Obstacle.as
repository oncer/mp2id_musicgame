package {
	import org.flixel.*;
	
	public class Obstacle extends FlxSprite
	{
		protected var level:Level;
		protected var start_x:Number; // absolute X value
		
		public function Obstacle(LEVEL:Level, X:Number, Y:Number)
		{
			this.level = LEVEL;
			this.x = this.start_x = X * Level.SCROLL_SPEED;
			this.y = Y;
		}
		
		override public function update():void
		{
			this.x = this.start_x - level.xpos;
			
			super.update();
		}
		
		public function playerOverlap(player:Player):Boolean
		{
			var y_dist:int = this.y - (player.y + player.height);
			var x_dist1:int = player.x + player.width - this.x;
			var x_dist2:int = this.x + this.width - player.x;
			//trace("y_dist: " + y_dist + ", x_dist1: " + x_dist1 + ", x_dist2 " + x_dist2);
			if (y_dist > -10 && y_dist < 3
					&& x_dist1 > 0
					&& x_dist2 > 0) {
				return true;
			}
			return false;
		}
	}
}
