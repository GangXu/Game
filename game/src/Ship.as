package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Nick 
	 */
	public class Ship extends FlxSprite
	{
		[Embed(source = "../assets/game-ship.png")]
		private var imgShip:Class;
		private var STEP:int;
		
		public function Ship(x:int,y:int) 
		{
			super(x, y, imgShip);
			this.STEP = 5;
			this.acceleration = new FlxPoint(15, 15);
			this.velocity = new FlxPoint(10, 10);
			
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("RIGHT"))
			{
				this.x += STEP;
				
			}
			if (FlxG.keys.pressed("LEFT"))
			{
				this.x -= STEP;
			}
			if (FlxG.keys.pressed("UP"))
			{
				this.y -= STEP;
			}
			if (FlxG.keys.pressed("DOWN"))
			{
				this.y += STEP;
			}
			
		}
		
	}

}