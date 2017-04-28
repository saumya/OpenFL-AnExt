package;


import com.saumya.MyApp;
import openfl.display.Sprite;
import openfl.events.Event;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE, onTheStage);
	}
	
	private function onTheStage(e:Event):Void{
		addChild( new MyApp(this.stage.stageWidth,this.stage.stageHeight) );
	}
	
	
}