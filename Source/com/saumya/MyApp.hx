package com.saumya;

import com.saumya.utils.AppBg;
import openfl.display.Graphics;
import openfl.display.Shape;
import openfl.display.Sprite;

import openfl.events.MouseEvent;

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
	}
	
	private function onClickAnyWhere(e:MouseEvent):Void{
		_utilAppBg.changeColorOfShape(this._appBg, Math.round( Math.random() * (256 * 256 * 256) ));
		//SetBrightness.setBrightness(0.5);
		//SetBrightness.sampleMethod(3);
		//MyExtension.mySampleMethod(0.5);
		SetBrightness.setBrightness(0.5);
	}
	
}