package
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		public var base_y:int = FlxG.height;
		
		public function Player(X:int, BASE_Y:int):void
		{
			this.base_y = BASE_Y;
			this.x = X;
			this.y = this.base_y - this.height;
			maxVelocity.y = 100;
			acceleration.y = 200;
		}
		
		override public function update():void
		{	
			if (velocity.y > 0
					&& this.y + this.height >= this.base_y) {
				velocity.y = 0;
				this.y = base_y - this.height;
				hitGround();
			}
			
			super.update();
		}
		
		public function start():void
		{
			// override in subclasses
		}
		
		public function stop():void
		{
			// override in subclasses
		}
		
		public function hitGround():void
		{
			// override in subclasses
		}
	}
}
