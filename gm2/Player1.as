package
{
	import org.flixel.*;
	public class Player1 extends Player
	{
		[Embed(source = "data/player1.png")] public var bmpPlayer1:Class;
		
		public function Player1(X:Number, Y:Number):void
		{
			super(X,Y);
			this.loadGraphic(bmpPlayer1,true,false,24,32);
			this.addAnimation("run", new Array(1, 0, 1, 2), 6);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}
