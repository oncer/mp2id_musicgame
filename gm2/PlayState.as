package
{
    import org.flixel.*;
    
    public class PlayState extends FlxState
    {
		[Embed(source = "data/readysetgo.png")] public var bmpReadySetGo:Class;
		
		protected var level:Level;
		public var player1:Player1;
		public var player2:Player2;
		public var player3:Player3;
		protected var players:FlxGroup;
		protected var readysetgo:FlxSprite;
		
		protected var countdown:Number;
		protected var started:Boolean;
		
        public function PlayState():void
        {
        }
        
        override public function create():void
        {	
			level = new Level(this);
			add(level);
			
			players = new FlxGroup();
			player1 = new Player1();
			player2 = new Player2();
			player3 = new Player3();
			players.add(player1);
			players.add(player2);
			players.add(player3);
			add(players);
			
			level.load(1); // !!! load the level AFTER creating the players
			
			readysetgo = new FlxSprite((320 - 128) / 2, (240 - 72) / 2);
			readysetgo.loadGraphic(bmpReadySetGo, true, false, 128, 72);
			
			add(readysetgo);
			
			countdown = 3.5;
			super.create();
        }
        
        public function start():void
        {
			level.start();
			started = true;
		}
		
		protected function _rsg_setAlpha(S:Number):void
		{
			if (S < 0) return;
			if (S < 0.25) {
				readysetgo.alpha = S * 4;
			} else if (S < 0.75) {
				readysetgo.alpha = 1;
			} else if (S <= 1) {
				readysetgo.alpha = 1 - (S - 0.75) * 4;
			}
		}

        override public function update():void
        {	
			countdown -= FlxG.elapsed;
			var s:Number;
			if (countdown > 3) {
				readysetgo.visible = false;
			} else if (countdown > 2) {
				s = countdown - 2;
				_rsg_setAlpha(1 - s);
				readysetgo.visible = true;
				readysetgo.frame = 0;
			} else if (countdown > 1) {
				s = countdown - 1;
				_rsg_setAlpha(1 - s);
				readysetgo.frame = 1;
			} else if (countdown > 0) {
				s = countdown;
				_rsg_setAlpha(1 - s);
				readysetgo.frame = 2;
			} else if (!started) {
				readysetgo.exists = false;
				start();
			}
			super.update();
        }
    }
}
