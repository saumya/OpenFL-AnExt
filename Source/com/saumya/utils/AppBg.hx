package com.saumya.utils;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.display.Graphics;

/**
 * A rectagle of a certain color
 * @author saumya
 * @version 1.0.0
 */
class AppBg
{
	private var _id:String;
	private var _bg:Shape;
	private var _bgG:Graphics;
	
	public function new() 
	{
		this._id = 'UtilAppBg';
	}
	
	public function getBgShape(width:Float,height:Float,?color:UInt=0xFF0000):Shape{
		this._bg = new Shape();
		
		this._bgG = this._bg.graphics;
		this._bgG.clear();
		this._bgG.beginFill(color, 1);
		this._bgG.drawRect(0, 0, width, height);
		this._bgG.endFill();
		
		return this._bg;
	}
	
	/**
	 * This is called after getBgShape() is called.
	 * Just returns the already done Shape
	 * @return Shape
	 */
	public function getDefaultShape():Shape{
		return this._bg;
	}
	
	public function changeColorOfShape(s:Shape, newColor:Int):Shape{
		var g:Graphics = s.graphics;
		var w:Float = s.width;
		var h:Float = s.height;
		g.clear();
		g.beginFill(newColor, 1);
		g.drawRect(0, 0, w, h);
		g.endFill();
		return s;
	}
	
}