#!/bin/bash

acompc -source-path ./DefaultLib/src/ -include-classes com.cantstopgames.utils.Utils com.cantstopgames.utils.ImageLoader com.cantstopgames.utils.XmlLoader com.cantstopgames.utils.RawDataLoader -swf-version=14 -output build/default/UtilsAPI.swc
 
unzip -o build/default/UtilsAPI.swc -d build/default
rm build/default/catalog.xml
rm build/default/UtilsAPI.swc

acompc -source-path ./AndroidSwcLib/src/ -include-classes com.cantstopgames.utils.Utils com.cantstopgames.utils.ImageLoader com.cantstopgames.utils.XmlLoader com.cantstopgames.utils.RawDataLoader -swf-version=14 -output build/Android-ARM/UtilsAPI.swc

unzip -o build/Android-ARM/UtilsAPI.swc -d build/Android-ARM
rm build/Android-ARM/catalog.xml
mv build/Android-ARM/UtilsAPI.swc build/

cd build

adt.bat -package -target ane com.cantstopgames.utils.ane extension.xml -swc UtilsAPI.swc -platform Android-ARM -C Android-ARM UtilsAPI.jar library.swf -platform default -C default/ .

