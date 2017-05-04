package com.saumya;

import com.saumya.raymp.components.ButtonWithBgColor;
import com.saumya.utils.AppBg;

import openfl.display.Graphics;
import openfl.display.Loader;
import openfl.display.LoaderInfo;
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
	
	private var imageName:String;
	private var _imageHolder:Sprite;
	
	//UI Elements
	private var _btnCamera:ButtonWithBgColor;
	private var _btnLaunch:ButtonWithBgColor;
	
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
		_imageHolder = new Sprite();
		addChild(_imageHolder);
		// UI
		_btnCamera = new ButtonWithBgColor("Take Photo",40);
		_btnLaunch = new ButtonWithBgColor("Launch Bleep App", 40);
		
		_btnCamera.x = _btnCamera.y = 20;
		_btnLaunch.x = 20;
		_btnLaunch.y = _btnCamera.y + _btnCamera.height + 40;
		
		addChild(_btnCamera);
		addChild(_btnLaunch);
		// add EventListeners
		addEventListener(MouseEvent.CLICK, onClickAnyWhere);
		_btnCamera.addEventListener(MouseEvent.CLICK, onTapCamera);
		_btnLaunch.addEventListener(MouseEvent.CLICK, onTapLaunch);
		AnCam.dispatcher.addEventListener(AnCam.CAM_CAPTURED_EVENT, onCamCaptured);
		//
	}
	
	private function onTapCamera(e:MouseEvent):Void{
		this.imageName = Date.now().toString();
		AnCam.captureImageAs(this.imageName);
	}
	private function onTapLaunch(e:MouseEvent):Void{
		trace('onTapLaunch');
		AnAppLaunch.launchAppWithPackageName("com.bittorrent.chat");
	}
	
	// Random Color change
	private function onClickAnyWhere(e:MouseEvent):Void{
		// change the color of BG
		_utilAppBg.changeColorOfShape(this._appBg, Math.round( Math.random() * (256 * 256 * 256) ));
		
		//SetBrightness.setBrightness(0.5);
		//SetBrightness.testToast(2);
		//RayToast.testToast();
		
		/*
		//RayToast.toastMessage( "Hello from OpenFL : "+ Date.now() );
		var s:String = RayToast.sendAndGetBackMessage( "Hello from OpenFL : " + Date.now() );
		trace('Returned Message :'+s);
		*/
		
		//Take picture from camera
		//AnCam.startCamera();
		
		/*
		this.imageName = Date.now().toString();
		AnCam.captureImageAs(this.imageName);
		*/
		//End
	}
	private function onCamCaptured(e:Event):Void{
		trace('MyApp : onCamCaptured : ');
		loadTheCapturedImage();
	}
	private function loadTheCapturedImage():Void{
		trace('MyApp : loadTheCapturedImage : ');
		var sCamImage:String = System.userDirectory + this.imageName +'.jpg';
		var r:URLRequest = new URLRequest(sCamImage);
		var loaderImage:Loader = new Loader();
		//addChild(loaderImage);
		
		loaderImage.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadComplete );
		loaderImage.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, function(evtObj){ trace('Loading Progress'); });
		loaderImage.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, function(errorObj){ trace( 'ERROR' ); });
		
		loaderImage.load(r);
	}
	private function onImageLoadComplete(event:Event):Void{
		trace('onImageLoadComplete');
		trace(event.target);
		
		//var loaderInfo:LoaderInfo = LoaderInfo(event.target);
		//var img = loaderInfo.content;
		//trace(event.target.content);
		
		var loaderInfo:LoaderInfo = cast(event.target, LoaderInfo);
		var img = loaderInfo.content;
		//img.width = stage.stageWidth;
		//img.height = stage.stageHeight;
		img.scaleX = img.scaleY = 0.2;
		img.x = img.y = 10;
		//addChild(img);
		_imageHolder.addChild(img);
		
		//var img:Loader = evt.currentTarget.loader as Loader;
		//addChild(img);
		/*
		var loader:Loader =  Loader(event.target.loader);
		var info:LoaderInfo = LoaderInfo(loader.contentLoaderInfo);
		
		var img = loader.content;
		addChild(img);
		*/
	}
	
}