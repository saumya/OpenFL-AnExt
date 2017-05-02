package com.saumya;

import com.saumya.utils.AppBg;
import openfl.display.Graphics;
import openfl.display.Loader;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.net.URLLoader;
import openfl.net.URLRequest;

import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.ErrorEvent;
import openfl.events.ProgressEvent;

import lime.system.System;

/**
 * Application Entry
 * @author saumya
 */
class MyApp extends Sprite
{
	private var _parentWidth:Float;
	private var _parentHeight:Float;
	private var _appBg:Shape;
	
	private var _utilAppBg:AppBg;
	
	public function new(w:Float,h:Float) 
	{
		super();
		_parentWidth = w;
		_parentHeight = h;
		_utilAppBg = new AppBg();
		init();
	}
	
	public function init():Void{
		_appBg = _utilAppBg.getBgShape(_parentWidth, _parentHeight, 0x00FF00);
		addChild(_appBg);
		// add EventListeners
		addEventListener(MouseEvent.CLICK, onClickAnyWhere);
		AnCam.dispatcher.addEventListener(AnCam.CAM_CAPTURED_EVENT,onCamCaptured);
	}
	
	private function onClickAnyWhere(e:MouseEvent):Void{
		_utilAppBg.changeColorOfShape(this._appBg, Math.round( Math.random() * (256 * 256 * 256) ));
		
		//SetBrightness.setBrightness(0.5);
		//SetBrightness.testToast(2);
		//RayToast.testToast();
		
		/*
		//RayToast.toastMessage( "Hello from OpenFL : "+ Date.now() );
		var s:String = RayToast.sendAndGetBackMessage( "Hello from OpenFL : " + Date.now() );
		trace('Returned Message :'+s);
		*/
		
		trace("==================== BEFORE ================== start Camera=================");
		AnCam.startCamera();
		trace("==================== AFTER ================== start Camera==================");
		
		/*
		trace( ":userDirectory:"+System.userDirectory.toString());
		trace( ":applicationStorageDirectory:"+System.applicationStorageDirectory.toString() );
		//trace( ":applicationDirectory:"+System.applicationDirectory.toString() );
		trace( ":documentsDirectory:" + System.documentsDirectory.toString() );
		
		var sCamImage:String = System.userDirectory + 'example.jpg';
		trace('image:' + sCamImage);
		
		var r:URLRequest = new URLRequest(sCamImage);
		var loaderImage:Loader = new Loader();
		//loaderImage.content.width = 300;
		//loaderImage.content.height = 400;
		addChild(loaderImage);
		
		loaderImage.contentLoaderInfo.addEventListener(Event.COMPLETE, function(evtObj){ trace('Loaded'); });
		loaderImage.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, function(evtObj){ trace('Loading Progress'); });
		loaderImage.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, function(errorObj){ trace( 'ERROR' ); });
		
		loaderImage.load(r);
		*/
	}
	private function onCamCaptured(e:Event):Void{
		trace('MyApp : onCamCaptured : ');
		loadTheCapturedImage();
	}
	private function loadTheCapturedImage():Void{
		trace('MyApp : loadTheCapturedImage : ');
		var sCamImage:String = System.userDirectory + 'example.jpg';
		var r:URLRequest = new URLRequest(sCamImage);
		var loaderImage:Loader = new Loader();
		addChild(loaderImage);
		
		loaderImage.contentLoaderInfo.addEventListener(Event.COMPLETE, function(evtObj){ trace('Loaded'); });
		loaderImage.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, function(evtObj){ trace('Loading Progress'); });
		loaderImage.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, function(errorObj){ trace( 'ERROR' ); });
		
		loaderImage.load(r);
	}
	
}