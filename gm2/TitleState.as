package  
{
	import org.flixel.*;
	
	public class TitleState extends FlxState
	{
		[Embed(source = "data/titlebg.png")] public var bmpTitle:Class;
		[Embed(source = "data/level1.png")] public var bmpLevel1:Class;
		[Embed(source = "data/level2.png")] public var bmpLevel2:Class;
		
		protected var level:int;
		
		public function State():void
		{			
		}
		
		override public function create():void
        {	
			var title:FlxSprite = new FlxSprite(0, 0, bmpTitle);
			var button1:FlxButton = new FlxButton(100, 100, onButton1);
			button1.loadGraphic(new FlxSprite(0, 0, bmpLevel1));
			var button2:FlxButton = new FlxButton(100, 170, onButton2);
			button2.loadGraphic(new FlxSprite(0, 0, bmpLevel2));
			
			add(title);
			add(button1);
			add(button2);
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("ONE"))
			{
				FlxG.fade.start(0xff000000, 1, on_fade_completed);
			}
			super.update();		
		}
		
		public function onButton1():void
		{
			level = 1;
			start();
		}
		
		public function onButton2():void
		{
			level = 2;
			start();
		}
		
		public function start():void
		{
			FlxG.fade.start(0xff000000, 1, on_fade_completed);
		}
		
		public function on_fade_completed():void
		{
			FlxG.state = new PlayState(level);
			return;
		}
	}

}
