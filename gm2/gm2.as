package
{
    import org.flixel.*;

    [SWF(width="640", height="480", backgroundColor="#000000")]
    [Frame(factoryClass="Preloader")]

    public class gm2 extends FlxGame
    {
        public function gm2():void
        {
            super(320,240,StartState,2);
        }
    }
}
