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
			height = 48;
			super(10, 144);
			maxVelocity.y = 130;
			acceleration.y = 200;
			this.loadGraphic(bmpPlayer1, true, false, 24, 48);
			this.addAnimation("stand", new Array(1, 1), 0);
			this.addAnimation("run", new Array(1, 0, 1, 2), 8);
			this.addAnimation("shrink", new Array(3, 4, 5), 12);
			this.addAnimation("duckrun", new Array(7, 6, 7, 8), 8);
			this.addAnimation("grow", new Array(5, 4, 3), 12);
			this.addAnimation("jump", new Array(7, 4), 12);
			this.addAnimation("jumping", new Array(7, 9), 6);
			
			this.state = this.last_state = STATE_STAND;
			this.play("stand");
		}
		
		override public function start():void
		{
			this.state = this.last_state = STATE_RUN;
			this.play("run");
			adjustHitbox(frame);
		}
		
		override public function stop():void
		{
			this.state = this.last_state = STATE_STAND;
			this.play("stand");
			adjustHitbox(frame);
		}
		
		protected function adjustHitbox(ANIMFRAME:int):void
		{
			// adjust hitbox values
			switch(ANIMFRAME)
			{
				case 0:
					offset.x = 3; offset.y = 1;
					width = 19; height = 47;
					break;
				case 1:
					offset.x = 3; offset.y = 1;
					width = 16; height = 47;
					break;
				case 2:
					offset.x = 2; offset.y = 2;
					width = 19; height = 46;
					break;
				case 3:
					offset.x = 2; offset.y = 7;
					width = 19; height = 41;
					break;
				case 4:
					offset.x = 2; offset.y = 12;
					width = 20; height = 36;
					break;
				case 5:
					offset.x = 2; offset.y = 21;
					width = 18; height = 27;
					break;
				case 6:
					offset.x = 0; offset.y = 27;
					width = 19; height = 21;
					break;
				case 7:
					offset.x = 0; offset.y = 26;
					width = 20; height = 22;
					break;
				case 8:
					offset.x = 1; offset.y = 27;
					width = 18; height = 21;
					break;
				case 9:
					offset.x = 1; offset.y = 26;
					width = 20; height = 22;
					break;
			}
			calcFrame();
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
						velocity.y = -130;
						y -= 10;
						break;
					case STATE_GROW:
						play("grow"); break;
					case STATE_SHRINK:
						play("shrink"); break;
				}
			}
			adjustHitbox(frame);
			last_state = state;
		}
		
		override public function render():void
		{
			this.y += this.offset.y;
			super.render();
			this.y -= this.offset.y;
		}
		
		override public function hitGround():void
		{
			if (state == STATE_JUMPING) {
				if (FlxG.keys.pressed(Config.KEY_P1)) {
					state = STATE_DUCKRUN;
				} else {
					state = last_state = STATE_GROW;
					play("grow");
					adjustHitbox(frame);
				}
			}
		}
	}
}
