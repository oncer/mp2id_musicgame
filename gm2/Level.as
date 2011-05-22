package
{
    import org.flixel.*;
    
    public class Level extends FlxGroup
    {
		[Embed(source = "data/background.png")] public var bmpBackground:Class;
		[Embed(source = "data/tiles.png")] public var bmpTiles:Class;
		
		public var background:FlxSprite;
        public var tm1:FlxTilemap;
        public var tm2:FlxTilemap;
        
        public var xpos:Number;
        protected var scroll:Number;
        protected const SCROLL_SPEED:Number = 100; // pixels per second
        
        protected var obstacles:Array;
        protected var obstaclesGroup:FlxGroup;
        public var playState:PlayState;

        public function Level(PLAYSTATE:PlayState):void
        {
            super();
            
            this.playState = PLAYSTATE;
            
            background = new FlxSprite(0, 0, bmpBackground);
            add(background);
            
			var a:Array = new Array();
			var widthInTiles:int = FlxG.width / 16;
			var heightInTiles:int = FlxG.width / 16;
			for (var y:int = 0; y < heightInTiles; y++) {
				for (var x:int = 0; x < widthInTiles; x++) {
					if (y == 4  || y == 9 || y == 14) {
						a.push((x % 8) + 1);
					} else {
						a.push(0);
					}
				}
			}
			tm1 = new FlxTilemap();
			tm1.loadMap(FlxTilemap.arrayToCSV(a, widthInTiles), bmpTiles);
			tm2 = new FlxTilemap();
			tm2.loadMap(FlxTilemap.arrayToCSV(a, widthInTiles), bmpTiles);
			
			add(tm1);
			add(tm2);
			
			obstacles = new Array();
			obstacles.push(new BumperObstacle (this, 300, 224));
			obstacles.push(new BumperObstacle (this, 400, 216));
			
			obstaclesGroup = new FlxGroup();
			for each (var o:Obstacle in obstacles) {
				obstaclesGroup.add(o);
			}
			add(obstaclesGroup);
			
			this.xpos = this.scroll = 0;
        }
        
        protected function selectBumperObstacle():void
        {
			for each (var o:Obstacle in obstacles) {
				if (o is BumperObstacle) {
					var bumper:BumperObstacle = o as BumperObstacle;
					if (bumper.state == BumperObstacle.STATE_LOADED) {
						bumper.select();
						break;
					} else if (bumper.state == BumperObstacle.STATE_SELECTED) {
						break;
					}
				}
			}
		}

        override public function update():void
        {
			var scrollAmount:Number = FlxG.elapsed * SCROLL_SPEED;
			
			this.xpos += scrollAmount;
			this.scroll += scrollAmount;
			
			if (this.scroll > FlxG.width) {
				this.scroll -= FlxG.width;
				var t:FlxTilemap = tm1;
				tm1 = tm2;
				tm2 = t;
			}
			
            tm1.x = -this.scroll;
            tm2.x = tm1.x + FlxG.width;
            
            selectBumperObstacle();
            
            super.update();
        }
    }
}
