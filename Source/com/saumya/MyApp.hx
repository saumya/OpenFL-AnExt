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
import openfl.events.KeyboardEvent;
import openfl.events.ErrorEvent;
import openfl.events.ProgressEvent;
import lime.ui.KeyCode;

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
	private var _btnWebView:ButtonWithBgColor;
	private var _btnCall:ButtonWithBgColor;
	//
	private var exitCounter:Int;
	
	public function new(w:Float,h:Float) 
	{
		super();
		_parentWidth = w;
		_parentHeight = h;
		_utilAppBg = new AppBg();
		
		this.addEventListener(Event.ADDED_TO_STAGE,onTheStage);
		//init();
	}
	private function onTheStage(e:Event):Void{
		e.preventDefault();
		this.removeEventListener(Event.ADDED_TO_STAGE,onTheStage);
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
		_btnWebView = new ButtonWithBgColor("Launch Web Saumya", 40);
		_btnCall = new ButtonWithBgColor("Call A Number", 40);
		
		_btnCamera.x = _btnCamera.y = 20;
		_btnLaunch.x = 20;
		_btnLaunch.y = _btnCamera.y + _btnCamera.height + 40;
		_btnWebView.x = 20;
		_btnWebView.y = _btnLaunch.y + _btnLaunch.height + 40;
		_btnCall.x = 20;
		_btnCall.y = _btnWebView.y + _btnWebView.height + 40;
		
		addChild(_btnCamera);
		addChild(_btnLaunch);
		addChild(_btnWebView);
		addChild(_btnCall);
		// add EventListeners
		addEventListener(MouseEvent.CLICK, onClickAnyWhere);
		//this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		_btnCamera.addEventListener(MouseEvent.CLICK, onTapCamera);
		_btnLaunch.addEventListener(MouseEvent.CLICK, onTapLaunch);
		_btnWebView.addEventListener(MouseEvent.CLICK, onTapWeb);
		_btnCall.addEventListener(MouseEvent.CLICK, onTapCall);
		AnCam.dispatcher.addEventListener(AnCam.CAM_CAPTURED_EVENT, onCamCaptured);
		//
	}
	
	private function onTapCamera(e:MouseEvent):Void{
		
		this.imageName = Date.now().toString();
		AnCam.captureImageAs(this.imageName);
		
	}
	private function onTapLaunch(e:MouseEvent):Void{
		
		AnAppLaunch.launchAppWithPackageName("com.bittorrent.chat");
		
	}
	private function onTapWeb(e:MouseEvent):Void{
		trace('onTapWeb');
		//WebView
		AnWebView.open("http://saumya.github.io/");
		//Browser
		//AnWebView.open("http://www.openfl.org/",true);
		
	}
	private function onTapCall(e:MouseEvent):Void{
		
		// Not sure why! Passing an INT provides Float and throws error
		// For the time being, we are passing String
		AnCall.callNum("08446992711");
		
	}
	
	// Checking for back button
	private function onKeyUp(e:KeyboardEvent){
		//trace('onKeyUp:' + e.keyCode);
		//trace('APP_CONTROL_BACK:' + KeyCode.APP_CONTROL_BACK);
		//e.preventDefault();
		switch(e.keyCode){
			case KeyCode.APP_CONTROL_BACK:
				if (exitCounter >= 3){
					// Exit after 3 TAPs on BACK button
					// Exit the Application. Default behaviour of Android.
				}else{
					e.preventDefault();
					trace('============ BACK ===========');
				}
		}
		
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