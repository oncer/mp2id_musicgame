package
{
    import org.flixel.*;
    
    public class PlayState extends FlxState
    {
		protected var level:Level;
		
        public function PlayState():void
        {
        }
        
        override public function create():void
        {
			level = new Level();
			add(level);
			
			super.create();
        }

        override public function update():void
        {
			super.update();
        }
    }
}
