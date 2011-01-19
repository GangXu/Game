package  
{
	import B2FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Nick 
	 */
	public class Box2dSpawner 
	{
		private var img:Class;
		private var body:B2FlxSprite;
		
		public function Box2dSpawner(body:B2FlxSprite, image:Class) 
		{
			this.body = body;
			this.body.createBody();
			this.img = image;
			this.body.loadGraphic(this.img, false, false, 32, 32, false);
			
		}
		
		
		public function spawnMany(coords:Array,total:int):void
		{
			for (var i = 0; i < total; i++)
			{
				
			}
		}
		
	}

}