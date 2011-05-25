package
{
	import org.flixel.*;
	public class Player1 extends Player
	{
		[Embed(source = "data/player1.png")] public var bmpPlayer1:Class;
		
		protected static const STATE_STAND:int = 0;
		protected static const STATE_RUN:int = 1;
		protected static const STATE_SHRINK:int = 2;
		protected static const STATE_DUCKRUN:int = 3;
		protected static const STATE_GROW:int = 4;
		protected static const STATE_JUMP:int = 5;
		protected static const STATE_JUMPING:int = 6;
		
		protected var state:int;
		protected var last_state:int;
		
		public function Player1():void
		{
			super(10, 144);
			maxVelocity.y = 100;
			acceleration.y = 200;
			this.loadGraphic(bmpPlayer1, true, false, 24, 48);
			this.addAnimation("stand", new Array(1, 1), 0);
			this.addAnimation("run", new Array(1, 0, 1, 2), 6);
			this.addAnimation("shrink", new Array(3, 4, 5), 6);
			this.addAnimation("duckrun", new Array(7, 6, 7, 8), 6);
			this.addAnimation("grow", new Array(5, 4, 3), 6);
			this.addAnimation("jump", new Array(7, 4), 12);
			this.addAnimation("jumping", new Array(7, 9), 6);
			
			this.state = this.last_state = STATE_STAND;
			this.play("stand");
		}
		
		override public function start():void
		{
			this.state = this.last_state = STATE_RUN;
			this.play("run");
		}
		
		override public function stop():void
		{
			this.state = this.last_state = STATE_STAND;
			this.play("stand");
		}
		
		override public function update():void
		{
			super.update();
			if (state == STATE_JUMP && finished) {
				this.state = STATE_JUMPING;
			}
			if (state == STATE_GROW && finished) {
				this.state = STATE_RUN;
			}
			if (state == STATE_SHRINK && finished) {
				this.state = STATE_DUCKRUN;
			}
			if (FlxG.keys.pressed(Config.KEY_P1)) {
				if (state == STATE_RUN) { // key pressed in running state, switch to duck mode
					state = STATE_SHRINK;
				}
			} else {
				if (state == STATE_DUCKRUN) { // key released in duck mode, initiate jumping sequence
					state = STATE_JUMP;
				}
			}
			if (state != last_state) { // change animation; TODO: change hitbox, too
				switch (state) {
					case STATE_RUN:
						play("run"); break;
					case STATE_DUCKRUN:
						play("duckrun"); break;
					case STATE_JUMP:
						play("jump"); break;
					case STATE_JUMPING:
						play("jumping"); 
						velocity.y = -100;
						y -= 10;
						break;
					case STATE_GROW:
						play("grow"); break;
					case STATE_SHRINK:
						play("shrink"); break;
				}
			}
			last_state = state;
		}
		
		override public function hitGround():void
		{
			if (state == STATE_JUMPING) {
				if (FlxG.keys.pressed(Config.KEY_P1)) {
					state = STATE_DUCKRUN;
				} else {
					state = last_state = STATE_GROW;
					play("grow");
				}
			}
		}
	}
}
