package
{
    import org.flixel.*;
    
    public class PlayState extends FlxState
    {
		
		protected var level:Level;
		public var player1:Player1;
		public var player2:Player2;
		public var player3:Player3;
		protected var players:FlxGroup;
		
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
			
			super.create();
        }

        override public function update():void
        {	
			super.update();
        }
    }
}
