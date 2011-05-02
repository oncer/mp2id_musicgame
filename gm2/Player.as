package
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		protected var base_y:int = FlxG.height;
		
		public function Player(X:int, BASE_Y:int):void
		{
			this.base_y = BASE_Y;
			this.x = X;
			this.y = this.base_y - this.height;
		}
		
		override public function update():void
		{
			maxVelocity.y = 100;
			acceleration.y = 600;
			
			if (this.y + this.height >= this.base_y) {
				velocity.y = 0;
				this.y = base_y - this.height;
			}
			
			super.update();
		}
	}
}
