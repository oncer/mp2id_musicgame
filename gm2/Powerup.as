package {
	import org.flixel.*;
	public class Powerup extends FlxSprite
	{
		[Embed(source = "data/powerup.png")] public var bmpPowerup:Class;
		[Embed(source = "data/powerup_explosion.png")] public var bmpPowerupExplosion:Class;
		
		protected var level:Level;
		protected var player:Player;
		protected var playerID:int;
		protected var start_x:Number; // absolute X value
		
		protected var emitter:FlxEmitter;
		protected var emit:Boolean;
		
		public function Powerup(LEVEL:Level, PID:int, X:Number, HEIGHT:int):void
		{
			this.loadGraphic(bmpPowerup, true, false, 12, 12);
			this.level = LEVEL;
			this.playerID = PID;
			switch (PID)
			{
				case 1: this.player = level.playState.player1; break;
				case 2: this.player = level.playState.player2; break;
				case 3: this.player = level.playState.player3; break;
			}
			this.x = this.start_x = X * Level.SCROLL_SPEED - this.width / 2 + 22;
			this.y = this.player.base_y - HEIGHT - this.width / 2;
			emitter = new FlxEmitter(x, y);
			emitter.createSprites(bmpPowerupExplosion, 20, 16, true, 0);
			emitter.setSize(12, 12);
			emitter.setXSpeed(-70, 70);
			emitter.setYSpeed(-70, 70);
			dead = false;
		}
		
		protected function miss():void
		{
			level.track.silencePlayer(playerID, true);
			exists = false;
		}
		
		protected function hit():void
		{
			level.track.silencePlayer(playerID, false);
			emit = true;
			emitter.start(true);
		}
		
		override public function update():void
		{
			if (emit) {
				emitter.update();
				return;
			}
			trace(x + " " + y);
			this.x = this.start_x - level.xpos;
				
			if (player.x + player.offset.x + player.width > this.x &&
				player.x + player.offset.x < this.x + this.width &&
				player.y + player.offset.y + player.height > this.y &&
				player.y + player.offset.y < this.y + this.height) {
				hit();
			}
			
			if (this.x < player.x - this.width) {
				miss();
			}
			
			emitter.x = x;
			emitter.y = y;
			super.update();
		}
		
		override public function render():void
		{
			if (emit) {
				emitter.render();
			} else {
				super.render();
			}
		}
	}
}
