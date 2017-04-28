package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class SetBrightness {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android && openfl)
		
		var resultJNI = setbrightness_sample_method_jni(inputValue);
		var resultNative = setbrightness_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return setbrightness_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var setbrightness_sample_method = Lib.load ("setbrightness", "setbrightness_sample_method", 1);
	
	#if (android && openfl)
	private static var setbrightness_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.SetBrightness", "sampleMethod", "(I)I");
	#end

	// ===========================================================
	#if android
	public static function setBrightness(brightness:Float):Void {
	    setbrightness_set_brightness_jni(brightness);
	}
	private static var setbrightness_set_brightness_jni = JNI.createStaticMethod("org.haxe.extension.SetBrightness", "setBrightness", "(F)V");
	#end
	// ===========================================================
	
	
}