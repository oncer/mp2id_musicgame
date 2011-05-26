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
			playState.player1.exists = false;
			playState.player2.exists = true;
			playState.player3.exists = false;
			
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
			
                        //========= FATMAN
			P(2, 0.75, 40); O_bumper(0.5, 0);
			P(2, 1.25, 50);
			P(2, 1.75, 40); O_bumper(1.5, 0);
			P(2, 2,    40); 
			P(2, 2.5,  40); O_bumper(2.5, 0);
			P(2, 3,    55);
			P(2, 4,    55); O_bumper(3.5, 0);
			P(2, 5,    50); O_bumper(4.75, 0);
			P(2, 6,    50); O_bumper(5.75, 0);
			P(2, 6.5,  55); O_bumper(6.75, 0);
			P(2, 7,    40); O_bumper(7.75, 10);
			P(2, 8,    40); O_bumper(8.75, 20);
			P(2, 9,    40); O_bumper(9.65, 30);
			P(2, 9.5,  40);
			P(2, 9.75, 45);
			P(2, 10,   50); O_bumper(10.75, 20);
			P(2, 10.25, 55);
			P(2, 10.5,  50);
			P(2, 10.75, 40);
			P(2, 11, 50);
			P(2, 11.25, 55);
			P(2, 11.5,  50);
			P(2, 11.75, 40); O_bumper(11.75, 20);
			P(2, 12, 50);
			P(2, 14, 40); O_bumper(13.1, 0);
			P(2, 14.5, 55); O_bumper(14.1, 10);
			P(2, 14.75, 40);
			P(2, 15, 40); O_bumper(15.25, 10);
			P(2, 15.25, 45);
			P(2, 15.5, 50);
			P(2, 15.75, 55);
                        // pause
                        P(2, 40.5, 50); O_bumper(40.25, 0);
                        P(2, 40.75, 40);
                        P(2, 41.5, 45); O_bumper(41.25, 0);
                        P(2, 41.75, 50);
                        P(2, 48, 40); O_bumper(47.75, 0);
                        P(2, 48.5, 50);
                        P(2, 49.25, 55); O_bumper(49, 0);
                        P(2, 49.5, 58);
                        P(2, 50, 10); O_bumper(50.5, 0);
                        P(2, 50.75, 50);
                        P(2, 51, 40);
                        P(2, 51.5, 20);
                        P(2, 52, 50); O_bumper(51.75, 0);
                        P(2, 52.75, 50);
                        P(2, 54.5, 40); O_bumper(54.25, 0);
                        P(2, 55, 50);
                        P(2, 55.5, 45); O_bumper(55.25, 10);
                        P(2, 60, 10);
                        P(2, 60.5, 20);
                        P(2, 61, 50); O_bumper(60.75, 0);
                        P(2, 61.5, 40);
                        P(2, 62, 50); O_bumper(61.75, 10);
                        P(2, 62.5, 40);
                        P(2, 63, 50); O_bumper(62.75, 10);
                        P(2, 72, 50); O_bumper(71.75, 0);
                        P(2, 72.75, 20);
                        P(2, 73, 25);
                        P(2, 73.75, 50); O_bumper(73.5, 0);
                        P(2, 74, 45);
                        P(2, 75, 10);
                        P(2, 76, 10);
			
                        //======= ACCORD
			P(1, 16, 10);
			P(1, 17, 10);
			P(1, 17.5, 20);
			P(1, 18.5, 30);
			P(1, 19.5, 40);
			P(1, 20, 70);
			P(1, 21, 40);
			P(1, 21.5, 30);
			P(1, 22, 20);
			P(1, 24, 70);
			P(1, 24.75, 40);
			P(1, 25.5, 30);
			P(1, 26.5, 20);
			P(1, 27, 30);
			P(1, 28, 40);
			P(1, 28.5, 40);
			P(1, 29, 50);
			P(1, 29.25, 40);
			P(1, 29.5, 40);
			P(1, 29.75, 60);
			P(1, 30, 40);
			P(1, 30.5, 30);
			P(1, 31, 30);
			P(1, 31.25, 40);
			P(1, 31.5, 40);
			P(1, 31.75, 60);
                        //pause
                        P(1, 42.75, 12);
                        P(1, 44, 12);
                        P(1, 47, 24);
                        P(1, 49, 60);
                        P(1, 50.5, 41);
                        P(1, 52, 50);
                        P(1, 52.5, 60);
                        P(1, 53, 50);
                        P(1, 54, 43);
                        P(1, 54, 25);
                        P(1, 56.5, 25);
                        P(1, 57, 10);
                        P(1, 57, 30);
                        P(1, 58.5, 35);
                        P(1, 59.5, 60);
                        P(1, 61.125, 42);
                        P(1, 68.5, 40);
                        P(1, 69.5, 42);
                        P(1, 71.25, 60);
                        P(1, 71.625, 40);
                        P(1, 72.5, 42);
                        P(1, 73.5, 40);
                        P(1, 75, 60);
                        P(1, 75.5, 50);
                        P(1, 78, 13);
			
                        //======= BIRD
			P(3, 32, 10);
			P(3, 33, 20);
			P(3, 34, 30);
			P(3, 34.5, 33);
			P(3, 34.75, 35);
			P(3, 35, 40);
			P(3, 36, 50);
			P(3, 37, 55);
			P(3, 38, 55);
			P(3, 38.25, 55);
			P(3, 38.5, 55);
			P(3, 38.75, 55);
			P(3, 39, 56);
			P(3, 39.25, 52);
			P(3, 39.75, 40);
			P(3, 40, 50);
			P(3, 41, 40);
			P(3, 42, 30);
			P(3, 42.5, 25);
			P(3, 43, 20);
			P(3, 43.5, 14);
			P(3, 44, 10);
			P(3, 45, 10);
			P(3, 45.75, 23);
			P(3, 46, 25);
			P(3, 48.25, 50);
			P(3, 49.25, 40);
			P(3, 50.25, 50);
			P(3, 51.25, 55);
			P(3, 54, 40);
			P(3, 54.25, 42);
			P(3, 54.5, 44);
			P(3, 54.625, 46);
			P(3, 54.875, 48);
			P(3, 55, 50);
			P(3, 55.125, 48);
			P(3, 55.25, 46);
			P(3, 55.5, 44);
			P(3, 55.625, 42);
			P(3, 55.75, 40);
			P(3, 55.875, 38);
			P(3, 56, 36);
			P(3, 58, 10);
			P(3, 59, 20);
			P(3, 64, 50);
			P(3, 65, 40);
			P(3, 66, 50);
			P(3, 66.5, 55);
			P(3, 67, 40);
			P(3, 68, 40);
			P(3, 69, 50);
			P(3, 70, 35);
			P(3, 70.5, 42);
			P(3, 71, 50);
			P(3, 72, 40);
			P(3, 72.5, 35);
			P(3, 73, 28);
			P(3, 74.25, 33);
			P(3, 74.75, 40);
			P(3, 75, 42);
			P(3, 76, 50);
			P(3, 76.25, 45);
			P(3, 76.5, 44);
			P(3, 76.75, 43);
			P(3, 77, 42);
			P(3, 77.25, 41);
			P(3, 77.5, 40);
			P(3, 77.75, 35);
			P(3, 78, 30);
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
