package  
{
	import Box2D.Dynamics.b2World;
	import org.flixel.*;
	import Box2D.*;
	/**
	 * ...
	 * @author Nick 
	 */
	public class SteelBox extends B2FlxSprite
	{
		[Embed(source = "../assets/environment/steel_crate.png")]
		private var crate:Class;
		
		public function SteelBox(x:int,y:int,world:b2World) 
		{
			super(x, y, 32, 32, world);
			this.createBody();
			this.loadGraphic(crate, false, false, 32, 32, false);
			
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}