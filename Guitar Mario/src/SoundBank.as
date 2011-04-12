package
{
	import org.flixel.*;
	
	public class SoundBank
	{
		[Embed(source = "data/snd/loop1.mp3")] private static var __loop_1: Class;
		[Embed(source = "data/snd/path1_1.mp3")] private static var __path_1_1: Class;
		[Embed(source = "data/snd/path1_2.mp3")] private static var __path_1_2: Class;
		[Embed(source = "data/snd/path1_3.mp3")] private static var __path_1_3: Class;
		[Embed(source = "data/snd/path2_1.mp3")] private static var __path_2_1: Class;
		[Embed(source = "data/snd/path2_2.mp3")] private static var __path_2_2: Class;
		[Embed(source = "data/snd/path2_3.mp3")] private static var __path_2_3: Class;
		[Embed(source = "data/snd/path2_4.mp3")] private static var __path_2_4: Class;
		[Embed(source = "data/snd/path3_1.mp3")] private static var __path_3_1: Class;
		[Embed(source = "data/snd/path3_2.mp3")] private static var __path_3_2: Class;
		
		private static const CLASSES: Array = new Array(
			__loop_1, // 0
			__path_1_1, __path_1_2, __path_1_3, // 1-3
			__path_2_1, __path_2_2, __path_2_3, __path_2_4, // 4-7
			__path_3_1, __path_3_2 // 8-9
		);
		
		public static const SOUNDS: Array = SoundBank.initSounds();
		
		private static function initSounds(): Array
		{
			var a: Array = new Array;
			for each (var c: Class in CLASSES) {
				var s: FlxSound = new FlxSound;
				a.push(s.loadEmbedded(c));
			}
			return a;
		}
	}
}

