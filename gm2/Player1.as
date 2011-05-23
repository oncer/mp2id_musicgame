package
{
	import org.flixel.*;
	public class Player1 extends Player
	{
		[Embed(source = "data/player1.png")] public var bmpPlayer1:Class;
		
		protected static const STATE_RUNNING:int = 1;
		protected static const STATE_DUCKING:int = 2;
		protected static const STATE_JUMPING:int = 3;
		
		protected var state:int;
		
		public function Player1():void
		{
			super(10, 144);
			this.loadGraphic(bmpPlayer1, true, false, 24, 48);
			this.addAnimation("run", new Array(1, 0, 1, 2), 6);
			this.addAnimation("duckrun", new Array(4, 3, 4, 5), 6);
			this.addAnimation("jump", new Array(4, 1, 7, 6), 6);
			
			this.state = STATE_RUNNING;
			this.play("run");
		}
		
		override public function update():void
		{
			super.update();
			var state_changed:Boolean = false;
			if (!state_changed && state == STATE_JUMPING) { // check jumping sequence
				if (this.finished) { // sequence finished, switch back to running state
					this.state = STATE_RUNNING;
					state_changed = true;
				}
			}
			if (FlxG.keys.pressed(Config.KEY_P1)) {
				if (state == STATE_RUNNING) { // key pressed in running state, switch to duck mode
					state = STATE_DUCKING;
					state_changed = true;
				}
			} else {
				if (state == STATE_DUCKING) { // key released in duck mode, initiate jumping sequence
					state = STATE_JUMPING;
					state_changed = true;
				}
			}
			if (state_changed) { // change animation; TODO: change hitbox, too
				if (state == STATE_RUNNING) {
					this.play("run");
				} else if (state == STATE_DUCKING) {
					this.play("duckrun");
				} else if (state == STATE_JUMPING) {
					this.play("jump");
				}
			}
		}
	}
}
