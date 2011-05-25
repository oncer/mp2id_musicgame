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
        
        protected var scrolling:Boolean;
        
        public var xpos:Number;
        protected var scroll:Number;
        public static const SCROLL_SPEED:Number = 100; // pixels per second
        
        protected var obstacles:Array;
        protected var obstaclesGroup:FlxGroup;
        
        protected var powerups:Array;
        protected var powerupsGroup:FlxGroup;
        
        public var playState:PlayState;
        
        public var track:Track;

        public function Level(PLAYSTATE:PlayState):void
        {
            super();
            
            this.playState = PLAYSTATE;
            
            track = new Track();
			add(track);
            
            background = new FlxSprite(0, 0, bmpBackground);
            add(background);
            
			var a:Array = new Array();
			var widthInTiles:int = FlxG.width / 16;
			var heightInTiles:int = FlxG.width / 16;
			for (var y:int = 0; y < heightInTiles; y++) {
				for (var x:int = 0; x < widthInTiles; x++) {
					//if (y == 4  || y == 9 || y == 14) {
					if (y == 14) {
						a.push((x % 8) + 1);
					} else if (y > 9) {
						a.push(9);
					} else if (y == 9) {
						a.push(10);
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
			
			this.xpos = this.scroll = 0;
			this.scrolling = false;
        }

		protected function O_bumper(X:Number, HEIGHT:int):void
		{
			obstacles.push(new BumperObstacle(this, X, HEIGHT));
		}
		
		protected function P(PID:int, X:Number, HEIGHT:int):void
		{
			powerups.push(new Powerup(this, PID, X, HEIGHT));
		}
        
        protected function _loadLevelTest():void
        {
		}
		
		protected function _loadLevel1():void
		{
			playState.player1.exists = true;
			playState.player2.exists = true;
			playState.player3.exists = true;
			
			P(2, 4, 50); P(2, 4.5, 50); P(2, 5, 50); P(2, 5.5, 50);
			O_bumper(3.75, 0); O_bumper(4.75, 0);
			
			P(2, 16, 45);
			P(2, 16.5, 45);
			P(2, 17, 40);
			P(2, 17.25, 50);
			P(2, 17.75, 40);
			O_bumper(15.75, 0); O_bumper(16.75, 0); 
			
			P(2, 24, 45); 
			P(2, 24.5, 50); 
			P(2, 24.75, 40);
			P(2, 25, 50); 
			P(2, 25.5, 45);
			P(2, 26, 40);
			P(2, 26.25, 50);
			P(2, 26.5, 45);
			P(2, 27, 40);
			P(2, 27.25, 50);
			P(2, 27.75, 45);
			O_bumper(23.75, 0); O_bumper(24.75, 0);
			O_bumper(25.75, 0); O_bumper(26.75, 0);
			
			P(2, 40, 50); 
			P(2, 40.5, 50);
			P(2, 41, 45); 
			P(2, 41.25, 55);
			P(2, 41.75, 40);
			P(2, 42, 40);
			P(2, 42.5, 45);
			P(2, 42.75, 40);
			P(2, 43, 50);
			P(2, 43.25, 55);
			O_bumper(39.75, 0); O_bumper(40.75, 10);
			O_bumper(41.75, 20); O_bumper(42.75, 10);
			
			P(2, 52, 40);
			P(2, 52.5, 50);
			P(2, 53.5, 60);
			P(2, 54, 50);
			P(2, 54.5, 45);
			P(2, 55, 50);
			P(2, 55.5, 45);
			O_bumper(51.75, 0); O_bumper(52.75, 10);
			O_bumper(53.75, 0); O_bumper(54.75, 0);
		}
		
		protected function _loadLevel2():void
		{
			playState.player1.exists = true;
			playState.player2.exists = true;
			playState.player3.exists = true;
		}
        
        public function load(ID:int):void
        {
			obstacles = new Array();
			powerups = new Array();
			switch(ID)
			{
				case 0:
					_loadLevelTest(); break;
				case 1:
					_loadLevel1(); break;
				case 2:
					_loadLevel2(); break;
			}
			obstaclesGroup = new FlxGroup();
			for each (var o:Obstacle in obstacles) {
				obstaclesGroup.add(o);
			}
			add(obstaclesGroup);
			powerupsGroup = new FlxGroup();
			for each (var p:Powerup in powerups) {
				powerupsGroup.add(p);
			}
			add(powerupsGroup);
			track.load(ID);
		}
		
		public function start():void
		{
			track.start();
		}
		
		public function stop():void
		{
			scrolling = false;
			playState.player1.stop();
			playState.player2.stop();
			playState.player3.stop();
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
			if (track.getTime() > 0) {
				if (!scrolling) {
					scrolling = true;
					if (playState.player1.exists) playState.player1.start();
					if (playState.player2.exists) playState.player2.start();
					if (playState.player3.exists) playState.player3.start();
				}
			} else {
				stop();
			}
			if (scrolling && track != null) {
				var scrollAmount:Number = FlxG.elapsed * SCROLL_SPEED;
				
				var oldXpos:Number = this.xpos;
				this.xpos = track.getTime() * SCROLL_SPEED;
				this.scroll += this.xpos - oldXpos;
				
				if (this.scroll > FlxG.width) {
					this.scroll -= FlxG.width;
					var t:FlxTilemap = tm1;
					tm1 = tm2;
					tm2 = t;
				}
				
				tm1.x = -this.scroll;
				tm2.x = tm1.x + FlxG.width;
				
				selectBumperObstacle();
			}
            
            super.update();
        }
    }
}
