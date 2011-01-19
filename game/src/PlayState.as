package
{
	
	import Box2D.Common.Math.b2Vec2;
	import flash.events.Event;
	import flash.ui.Mouse;
	import org.flixel.*;
	import Box2D.*;
	import Box2D.Collision.*;
	import Box2D.Dynamics.*;
	import SteelBox;
	import com.bit101.components.*;
	public class PlayState extends FlxState
	{	
		var slider:HSlider;
		var label:Label;
		var world:b2World;
		var cube:SteelBox;
		var cube2:SteelBox;
		var gravity:b2Vec2;
		
		[Embed(source = "../assets/environment/floor.png")]
		private var ImgFloor:Class;
		
		[Embed(source = "cursor/cursor.png")]
		private var ImgCursor:Class
		
		var cursor:FlxSprite;
		
		override public function create():void		
		{
			setupWorld();
			setupControls();
			//FlxG.mouse.show(ImgCursor,16,16);
			//FlxG.mouse.hide();
			Mouse.show();
			/*
			 * create teh floor
			 */
			var floor:B2FlxTileblock = new B2FlxTileblock(0, 480-16, 640, 16, world);
			floor.createBody();
			floor.loadGraphic(ImgFloor);
			add(floor);
			
			var ceiling:B2FlxTileblock = new B2FlxTileblock(0, 0, 640, 16, world);
			ceiling.createBody();
			ceiling.loadGraphic(ImgFloor);
			ceiling.fixed = true;
			add(ceiling);
			/*
			 * create falling box
			 */
			cube = new SteelBox(100, 400, world);
			
			add(cube);
			 
			
			super.create();
		}
		
		public function setupControls():void 
		{
			slider = new HSlider(null, 400, 30);
			slider.minimum = -30;
			slider.maximum = 30;
			slider.addEventListener(Event.CHANGE, onsliderchange);
			label = new Label(null, 400, 40, "");
			
			addChild(label);
			addChild(slider);
		}
		
		private function onsliderchange(e:Event):void 
		{
			world.SetGravity(new b2Vec2(0, slider.value));
			label.text = "Gravity is: " + slider.value.toString();
		}
		
		/* public function CreateBatch(x:int, y:int, Enemytype:FlxSprite, number:int):void
		 *{
		 *for (var i = 0; i < number; i++)
		 *Enemytype = new Enemytype(x += 15, y, world)
		 *add(Enemytype)		
		 }*/
		 
		
		private function setupWorld():void
		{
			gravity = new b2Vec2(0, -9.8);
			world = new b2World(gravity, false); // this is change TEMPORARILY to false
 		}
		
		override public function update():void
		{
			super.update();
			
			world.Step(FlxG.elapsed, 10, 10);
		}
		
	}

}

