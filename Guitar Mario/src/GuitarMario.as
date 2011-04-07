package {
    import org.flixel.*;
 
    [SWF(width="640", height="480", backgroundColor="#000000")]
 
    public class GuitarMario extends FlxGame
    {
        public function GuitarMario():void
        {
			super(320,240,PlayState,2);
        }
    }
}