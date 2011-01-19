package

{

	import org.flixel.*;

	[SWF(width="640", height="480", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]



	public class game extends FlxGame
	{

		public function game()
		{

			super(320*2,240*2,MenuState,1);

		}

	}

}

