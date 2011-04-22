package
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		public function Player(X:Number, Y:Number):void
		{
			super(X,Y);
		}
		
		override public function update():void
		{
			maxVelocity.y = 100;
			acceleration.y = 600;
			
			super.update();
		}
	}
}
