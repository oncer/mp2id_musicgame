package
{
	import org.flixel.*;
	public class Player3 extends Player
	{
		[Embed(source = "data/player3.png")] public var bmpPlayer3:Class;
		
		public static const STATE_FLY:int = 1;
		public static const STATE_FLYUP:int = 2;
		
		protected var state:int;
		
		public function Player3():void
		{
			height = 24;
			super(10, 64);
			maxVelocity.y = 50;
			this.loadGraphic(bmpPlayer3, true, false, 32, 24);
			this.addAnimation("fly", new Array(0, 1), 6);
			this.addAnimation("flyup", new Array(0, 1), 8);
			this.state = STATE_FLY;
			this.play("fly");
			acceleration.y = 100;
			
			height = 17;
			offset.y = 2;
		}
		
		override public function start():void
		{
		}
		
		override public function stop():void
		{
		}
		
		override public function update():void
		{
			super.update();
			if (velocity.y < 0
					&& this.y < this.base_y - 64) {
				velocity.y = 0;
				this.y = this.base_y - 64;
			}
			var state_changed:Boolean = false;
			if (FlxG.keys.pressed(Config.KEY_P3)) {
				if (this.state != STATE_FLYUP) {
					this.state = STATE_FLYUP;
					state_changed = true;
				}
			} else {
				if (this.state != STATE_FLY) {
					this.state = STATE_FLY;
					state_changed = true;
				}
			}
			if (state_changed) {
				switch (state) {
					case STATE_FLY:
						play2("fly");
						velocity.y = 0;
						acceleration.y = 200;
						break;
					case STATE_FLYUP:
						play2("flyup");
						acceleration.y = -200;
						break;
				}
			}
		}
	}
}
