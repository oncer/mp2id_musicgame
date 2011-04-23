package
{
	import org.flixel.*;
	public class Player2 extends Player
	{
		[Embed(source = "data/player2.png")] public var bmpPlayer2:Class;
		
		public function Player2():void
		{
			super(10, 224);
			this.loadGraphic(bmpPlayer2, true, false, 24, 32);
			this.addAnimation("run", new Array(1, 0, 1, 2), 6);
			this.play("run");
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}
