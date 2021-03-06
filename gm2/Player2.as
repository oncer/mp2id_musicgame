package
{
	import org.flixel.*;
	public class Player2 extends Player
	{
		[Embed(source = "data/player2.png")] public var bmpPlayer2:Class;
		[Embed(source = "data/player2_roll.png")] public var bmpPlayer2_roll:Class;
		
		public static const STATE_STANDING:int = 0;
		public static const STATE_RUNNING:int = 1;
		public static const STATE_ROLLING:int = 2;
		
		public var state:int;
		
		protected var sprite_rolling:FlxSprite;
		
		public function Player2():void
		{
			height = 32;
			super(10, 224);
			sprite_rolling = new FlxSprite();
			this.loadGraphic(bmpPlayer2, true, false, 24, 32);
			this.addAnimation("stand", new Array(1, 1), 0);
			this.addAnimation("run", new Array(1, 0, 1, 2), 8);
			this.play("stand");
			sprite_rolling.loadRotatedGraphic(bmpPlayer2_roll, 32, -1, false);
			sprite_rolling.angle = 0;
			this.state = STATE_STANDING;
		}
		
		override public function start():void
		{
			this.state = STATE_RUNNING;
			this.play("run");
		}
		
		override public function stop():void
		{
			this.state = STATE_STANDING;
			this.play("stand");
		}
		
		override public function update():void
		{
			super.update();
			if (state == STATE_ROLLING) {
				sprite_rolling.update();
				sprite_rolling.x = this.x;
				sprite_rolling.y = this.y;
				sprite_rolling.angle += FlxG.elapsed * 360;
				if (sprite_rolling.angle > 360) {
					sprite_rolling.angle -= 360;
				}
			}
		}
		
		override public function render():void
		{
			if (state == STATE_RUNNING) {
				super.render();
			} else if (state == STATE_ROLLING) {
				sprite_rolling.render();
			}
		}
		
		public function bump():void
		{
			this.state = STATE_ROLLING;
			velocity.y = -100;
			y -= 2;
			trace("player2.bump()");
		}
		
		override public function hitGround():void
		{
			if (sprite_rolling.angle > 340 || sprite_rolling.angle < 20) {
				this.state = STATE_RUNNING;
			}
		}
	}
}
