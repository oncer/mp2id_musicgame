package
{
    import org.flixel.*;
    
    public class Level extends FlxObject
    {
		[Embed(source = "data/tiles.png")] public var bmpTiles:Class;
		
        protected var tm1:FlxTilemap;
        protected var tm2:FlxTilemap;

        public function Level():void
        {
            super(0, 0, FlxG.width * 2, FlxG.height);
			var a:Array = new Array();
			var widthInTiles:int = FlxG.width / 16;
			var heightInTiles:int = FlxG.width / 16;
			for (var y:int = 0; y < heightInTiles; y++) {
				for (var x:int = 0; x < widthInTiles; x++) {
					if (y == 4  || y == 9 || y == 14) {
						a.push((x % 8) + 1);
					} else {
						a.push(0);
					}
				}
			}
			tm1 = new FlxTilemap();
			tm1.loadMap(FlxTilemap.arrayToCSV(a, widthInTiles), bmpTiles);
			tm2 = new FlxTilemap();
			tm2.loadMap(FlxTilemap.arrayToCSV(a, widthInTiles), bmpTiles);
        }

        override public function update():void
        {
			this.x -= .5;
			
			if (this.x < -FlxG.width) {
				this.x += FlxG.width;
				var t:FlxTilemap = tm1;
				tm1 = tm2;
				tm2 = t;
			}
			
            tm1.x = this.x;
            tm2.x = tm1.x + FlxG.width;
            tm1.update();
            tm2.update();
        }
        
        override public function render():void
        {
			tm1.render();
			tm2.render();
		}
    }
}
