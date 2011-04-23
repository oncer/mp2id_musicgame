package
{
	import org.flixel.*;
	public class Player3 extends Player
	{
		[Embed(source = "data/player3.png")] public var bmpPlayer3:Class;
		
		public function Player3():void
		{
			super(10, 64);
			this.loadGraphic(bmpPlayer3, true, false, 32, 24);
			this.addAnimation("fly", new Array(0, 1), 6);
			this.play("fly");
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}
