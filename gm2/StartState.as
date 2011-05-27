package  
{
	import org.flixel.*;
	
	public class StartState extends FlxState
	{
		[Embed(source = "data/startscreen.png")] public var bmpStartscreen:Class;
		
		public function TitleState():void
		{			
		}
		
		override public function create():void
        {	
			var title:FlxSprite = new FlxSprite(0, 0, bmpStartscreen);
			
			add(title); 

                        FlxG.mouse.show();
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed()) {
				FlxG.state = new TState();
			}
			if (FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("ENTER")) {
				FlxG.state = new TState();
			}
		}
	}
}
