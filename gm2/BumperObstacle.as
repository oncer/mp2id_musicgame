package {
	import org.flixel.*;
	
	public class BumperObstacle extends Obstacle
	{
		[Embed(source = "data/bumper.png")] public var bmpBumperObstacle:Class;
		
		public static const STATE_LOADED:int = 1;
		public static const STATE_SELECTED:int = 2;
		public static const STATE_FIRED:int = 3;
		public static const STATE_EMPTY:int = 4;
		
		public var state:int = STATE_LOADED;
		
		public function BumperObstacle(LEVEL:Level, X:Number, Y:Number):void
		{
			super(LEVEL, X, Y);
			this.loadGraphic(bmpBumperObstacle, true, false, 24, 12);
			this.addAnimation("loaded", new Array(0), 1);
			this.addAnimation("selected", new Array(0, 1), 8);
			this.addAnimation("fired", new Array(2, 1, 2, 1), 20);
			this.addAnimation("empty", new Array(3, 3), 1);
		}
		
		public function select():void
		{
			if (this.state == STATE_LOADED && this.x < FlxG.width) {
				this.play("selected");
				this.state = STATE_SELECTED;
			}
		}
		
		public function fire():void
		{
			if (this.state == STATE_SELECTED) {
				this.play("fired");
				this.state = STATE_FIRED;
				trace("fired");
			}
		}
		
		override public function update():void
		{
			super.update();
			if (this.state == STATE_SELECTED && FlxG.keys.justPressed(Config.KEY_P2)) {
				fire();
			}
			if (this.state == STATE_FIRED && this.finished) {
				this.play("empty");
				this.state = STATE_EMPTY;
			}
			if (this.x + this.width < 0) {
				this.play("empty");
				this.state = STATE_EMPTY;
			}
		}
	}
}
