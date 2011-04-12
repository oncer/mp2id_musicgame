package
{
	import org.flixel.*;
	
	public class SoundPos
	{
		public var x: int; // in beats
		public var y: int; // 1, 2 or 3
		public var sound: FlxSound;
		
		public function SoundPos(x:int, y:int, sound:int): void
		{
			this.x = x;
			this.y = y;
			this.sound = SoundBank.SOUNDS[sound];
		}
	}
}
