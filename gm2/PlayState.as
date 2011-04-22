package
{
    import org.flixel.*;
    
    public class PlayState extends FlxState
    {
		
		protected var level:Level;
		protected var player1:Player1;
		protected var players:FlxGroup;
		
        public function PlayState():void
        {
        }
        
        override public function create():void
        {
			level = new Level();
			add(level);
			
			players = new FlxGroup();
			player1 = new Player1(0,0);
			player1.play("run");
			players.add(player1);
			
			add(players);
			
			super.create();
        }

        override public function update():void
        {
			FlxU.collide(level, players);
			
			super.update();
        }
    }
}
