package {
	import org.flixel.*;
	public class Sequence
	{
		private var soundPos: Array;
		private var currentPos: int;
		private var currentSoundIdx: int;
		
		public function Sequence(): void
		{
			soundPos = new Array(
				new SoundPos( 4,  1,  1),
				new SoundPos( 8,  2,  4),
				new SoundPos(12,  1,  2),
				
				new SoundPos(16,  1,  1),
				new SoundPos(20,  2,  4),
				new SoundPos(20,  3,  8),
				new SoundPos(24,  1,  3),
				new SoundPos(26,  2,  5),
				new SoundPos(28,  3,  8),
				
				new SoundPos(32,  2,  6),
				new SoundPos(32,  3,  9),
				new SoundPos(36,  3,  9),
				new SoundPos(37,  1,  3),
				new SoundPos(40,  3,  9),
				new SoundPos(43,  2,  5),
				new SoundPos(44,  3,  9),
				
				new SoundPos(48,  2,  7),
				new SoundPos(48,  3,  8),
				new SoundPos(52,  3,  8),
				new SoundPos(53,  1,  3),
				new SoundPos(56,  3,  8),
				new SoundPos(58,  2,  4),
				new SoundPos(60,  3,  8)
			);
			currentPos = 0;
			currentSoundIdx = 0;
		}
		
		/*public function nextBeat(skew: int): Array
		{
			var a: Array = new Array;
			while (currentSoundIdx < soundPos.length && (currentPos) >= soundPos[currentSoundIdx].x) {
				soundPos[currentSoundIdx].sound.play();
				currentSoundIdx++;
			}
			//while (currentSoundIdx < soundPos.length && (currentPos + skew) >= soundPos[currentSoundIdx].x) {
			//	a.push(soundPos[currentSoundIdx]);
			//	currentSoundIdx++;
			//}
			currentPos++;
			return a;
		}*/
		/*public function beats(position: Number): void
		{
			var beatPos: Number = position / 500.;
			while (currentSoundIdx < soundPos.length && (beatPos) >= soundPos[currentSoundIdx].x) {
				soundPos[currentSoundIdx].sound.play();
				currentSoundIdx++;
			}
		}*/
		public function rewind(): void
		{
			currentSoundIdx = 0;
		}
		
		public function beats(position: Number, distance: int): Array
		{
			var a: Array = new Array;
			var distanceTime: Number = distance / Enemy.SPEED * 1000.;
			var beatPos: Number = (position + distanceTime) / 500.;
			while (currentSoundIdx < soundPos.length && (beatPos) >= soundPos[currentSoundIdx].x) {
				a.push(soundPos[currentSoundIdx]);
				currentSoundIdx++;
			}
			return a;
		}
	}
}
