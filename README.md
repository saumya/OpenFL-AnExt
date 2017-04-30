OpenFL Android Extension
==========================

 Lime	 `lime create openfl project MyProject`
 OpenFL	 `openfl create project MyProject` 
 
 For writing extensions `lime create extension SetBrightness` 
 
OpenFL [commands are a frontend][1] for Lime Commands. So all Lime commands can be called from OpenFL commands.

Android Extension [Tutorial][2] reference

### Extension writing
 
 Here are the steps to make an Android Extension
```
//create
lime create extension SetBrightness
lime create extension MyExtension
//compile
lime rebuild SetBrightness android
lime rebuild MyExtension android
//include in project by adding it in projecct.xml
<include path="ext/SetBrightness" />
```







[1]: http://www.openfl.org/learn/docs/tools/
[2]: https://player03.com/2014/08/09/openfl-extensions/
 