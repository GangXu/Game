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
	import flash.events.MouseEvent;
	
	public class PlayState extends FlxState
	{	
		// components
		private var slider:HSlider;
		private var label:Label;
		private var reset:PushButton
		private var velx:HSlider;
		
		// end components
		private var world:b2World;
		private var cube:SteelBox;
		
		[Embed(source = "../assets/environment/floor.png")]
		private var ImgFloor:Class;
		
		[Embed(source = "cursor/cursor.png")]
		private var ImgCursor:Class
		
		private var cursor:FlxSprite;
		
		private var ship:Ship;
		override public function create():void		
		{
			setupWorld();
			setupControls();
			FlxG.mouse.show(ImgCursor,0,0);
			
			
			
			var floor:B2FlxTileblock = new B2FlxTileblock(0, 480-16, 640, 16, world);
			floor.createBody();
			floor.loadGraphic(ImgFloor);
			add(floor);
			
			var ceiling:B2FlxTileblock = new B2FlxTileblock(0, 0, 640, 16, world);
			ceiling.createBody();
			ceiling.loadGraphic(ImgFloor);
			ceiling.fixed = true;
			add(ceiling);
			
			cube = new SteelBox(100, 400, world);
			
			add(cube);
			
			ship = new Ship(100, 100);
			add(ship);
			
			super.create();
		}
		
		public function setupControls():void 
		{
			slider = new HSlider(null, 400, 20);
			slider.minimum = -30;
			slider.maximum = 30;
			slider.addEventListener(Event.CHANGE, onsliderchange);
			addChild(slider);
			
			label = new Label(null, 400, 40, "");
			addChild(label);
			
			reset = new PushButton(null, 400, 55, "Reset");
			addChild(reset);
			reset.addEventListener(MouseEvent.CLICK, resetclicked);
			
			velx = new HSlider(null, 400, 85);
			velx.minimum = -100;
			velx.maximum = 100;
			addChild(velx);
			
			velx.addEventListener(Event.CHANGE, velxchange);
			
		}
		
		private function velxchange(e:Event):void 
		{
		
		}
		
		private function resetclicked(e:MouseEvent):void 
		{
			world.SetGravity(new b2Vec2(0, 0));
			slider.value = 0;
			label.text = ""
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
			
			world = new b2World(new b2Vec2(0, -9.8), false); // this is change TEMPORARILY to false
 		}
		
		override public function update():void
		{
			super.update();
			world.Step(FlxG.elapsed, 10, 10);
			
		}
		
	}

}

