package {
	import org.flixel.*;
	public class Powerup extends FlxSprite
	{
		[Embed(source = "data/powerup.png")] public var bmpPowerup:Class;
		
		protected var level:Level;
		protected var player:Player;
		protected var start_x:Number; // absolute X value
		
		public function Powerup(LEVEL:Level, PID:int, X:Number, HEIGHT:int):void
		{
			this.loadGraphic(bmpPowerup, true, false, 12, 12);
			this.level = LEVEL;
			switch (PID)
			{
				case 1: this.player = level.playState.player1; break;
				case 2: this.player = level.playState.player2; break;
				case 3: this.player = level.playState.player3; break;
			}
			this.x = this.start_x = X * Level.SCROLL_SPEED - this.width / 2 + 22;
			this.y = this.player.base_y - HEIGHT - this.width / 2;
		}
		
		protected function miss():void
		{
			trace("miss");
			exists = false;
		}
		
		protected function hit():void
		{
			trace("hit");
			exists = false;
		}
		
		override public function update():void
		{
			trace(x + " " + y);
			this.x = this.start_x - level.xpos;
				
			if (overlaps(this.player)) {
				hit();
			}
			
			if (this.x < -this.width) {
				miss();
			}
			
			super.update();
		}
	}
}
