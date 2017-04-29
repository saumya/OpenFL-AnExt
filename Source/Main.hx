package;

import camera.Camera;
import camera.event.CameraEvent;

import com.saumya.MyApp;

import haxe.io.Bytes;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.Assets;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE, onTheStage);
	}
	
	private function onTheStage(e:Event):Void{
		this.removeEventListener(Event.ADDED_TO_STAGE, onTheStage);
		addChild( new MyApp(this.stage.stageWidth, this.stage.stageHeight) );
		//checkCamera();
		this.addEventListener(MouseEvent.CLICK, onTapTheStage);
	}
	
	private function onTapTheStage(e:MouseEvent):Void{
		checkCamera();
	}

	private function checkCamera():Void{
		
		Camera.Initialize();
		// Show this PNG over the top of the native camera view
        //Camera.SetCameraOverlayImage(Assets.getBitmapData("assets/img/camera-overlay.png"));
        // Take photo, limit max possible size to 1024x1024, JPEG quality 0.9
        Camera.CapturePhoto(1024, 0.9);
		
        //
        stage.addEventListener(CameraEvent.PHOTO_CAPTURED, HandlePhotoCaptured);
        stage.addEventListener(CameraEvent.PHOTO_CANCELLED, function(e) { trace("CameraEvent.PHOTO_CANCELLED");  trace(e); });
	}
	public function HandlePhotoCaptured(e:CameraEvent) : Void
    {
		trace("CameraEvent.PHOTO_CAPTURED");
        var bitmapData:BitmapData = e.GetBitmapData();
        var jpegBytes:Bytes = e.GetImageData();
        addChild(new Bitmap(bitmapData));
    }
	
	
}