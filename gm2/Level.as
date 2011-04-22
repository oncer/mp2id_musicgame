package
{
    import org.flixel.*;
    
    public class Level extends FlxGroup
    {
		[Embed(source = "data/tiles.png")] public var bmpTiles:Class;
		
        public var tm1:FlxTilemap;
        public var tm2:FlxTilemap;
        
        protected var scroll:Number;

        public function Level():void
        {
            super();
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
			
			add(tm1);
			add(tm2);
			
			this.scroll = 0;
        }

        override public function update():void
        {
			this.scroll += 2;
			
			if (this.scroll > FlxG.width) {
				this.scroll -= FlxG.width;
				var t:FlxTilemap = tm1;
				tm1 = tm2;
				tm2 = t;
			}
			
            tm1.x = -this.scroll;
            tm2.x = tm1.x + FlxG.width;
            
            super.update();
        }
    }
}
