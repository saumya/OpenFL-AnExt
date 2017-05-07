OpenFL Android Extension Experiment
===================================
 Uses [RayToast][4] for displaying toast messages on Android.

 - Android Extension [Tutorial][2] reference
 - [Sending Data back from Native Code to Haxe][5]
 
### Extension writing
 
 Here are the steps to make an Android Extension
 
 - Create
```
lime create extension SetBrightness
lime create extension MyExtension
```
 
 - Compile
```
lime rebuild SetBrightness android
lime rebuild MyExtension android
```
 
 - Include in project by adding it in project.xml
```
<include path="ext/SetBrightness" />
<include path="ext/MyExtension" />
```
The paths above can be relative to the project folder that uses the extension. That means extensions can be stored anywhere in the computer.
 
### Notes

The JNI [short code reference][3]

 Lime	 `lime create openfl project MyProject`          
 OpenFL	 `openfl create project MyProject` 
 
 For writing extensions `lime create extension SetBrightness` 
 
OpenFL [commands are a frontend][1] for Lime Commands. So all Lime commands can be called from OpenFL commands.


## My extensions
 - [AnCam][a1]
 - [RayToast][a2]
 - [AnWebView][a3]
 - [AnAppLaunch][a4]
 - [AnCall][a5]





[1]: http://www.openfl.org/learn/docs/tools/
[2]: https://player03.com/2014/08/09/openfl-extensions/
[3]: https://docs.oracle.com/javase/7/docs/technotes/guides/jni/spec/types.html
[4]: https://github.com/saumya/RayToast
[5]: http://www.stencyl.com/help/viewPrint/229
	
[ExampleImp]: https://github.com/saumya/OpenFL-AnExt
[a1]: https://github.com/saumya/AnCam
[a2]: https://github.com/saumya/RayToast
[a3]: https://github.com/saumya/AnWebView
[a4]: https://github.com/saumya/AnAppLaunch
[a5]: https://github.com/saumya/AnCall
 