package {
	import org.flixel.*;
	public class Track extends FlxGroup
	{
		[Embed(source = "data/tracks/easygoing.mp3")] public var sndEasygoing:Class;
		[Embed(source = "data/tracks/easygoing_fatman.mp3")] public var sndEasygoing_fatman:Class;
		
		protected var track:FlxSound;
		protected var track_fatman:FlxSound;
		protected var track_accord:FlxSound;
		protected var track_bird:FlxSound;
		
		public static const FATMAN:int = 2;
		public static const ACCORD:int = 1;
		public static const BIRD:int = 3;
		
		public function Track():void
		{
			super();
		}
		
		public function load(ID:int):void
		{
			track = null;
			track_fatman = null;
			track_accord = null;
			track_bird = null;
			switch(ID)
			{
				case 1:
					track = new FlxSound().loadEmbedded(sndEasygoing);
					track_fatman = new FlxSound().loadEmbedded(sndEasygoing_fatman);
					add(track);
					add(track_fatman);
					break;
				case 2:
					break;
			}
		}
		
		public function start():void
		{
			if (track != null) track.play();
			if (track_fatman != null) track_fatman.play(track.position);
			if (track_accord != null) track_accord.play(track.position);
			if (track_bird != null) track_bird.play(track.position);
		}
		
		public function getTime():Number
		{
			if (track == null) return 0;
			var r:Number = (track.position - 50) / 1000;
			if (r < 0) return 0;
			return r;
		}
		
		public function silencePlayer(ID:int, SILENCE:Boolean):void
		{
			var s:FlxSound;
			switch(ID) { 
				case FATMAN: s = track_fatman; break;
				case ACCORD: s = track_accord; break;
				case BIRD: s = track_bird; break;
			}
			if (s == null) return;
			if (SILENCE) {
				s.volume = 0.33;
			} else {
				s.volume = 1;
			}
		}
	}
}
