#!/bin/bash

acompc -source-path ./DefaultLib/src/ -include-classes com.cantstopgames.filereader.FileReader com.cantstopgames.filereader.ImageLoader com.cantstopgames.filereader.XmlLoader com.cantstopgames.filereader.RawDataLoader -swf-version=14 -output build/default/FileReaderAPI.swc
 
unzip -o build/default/FileReaderAPI.swc -d build/default
rm build/default/catalog.xml
rm build/default/FileReaderAPI.swc

acompc -source-path ./AndroidSwcLib/src/ -include-classes com.cantstopgames.filereader.FileReader com.cantstopgames.filereader.ImageLoader com.cantstopgames.filereader.XmlLoader com.cantstopgames.filereader.RawDataLoader -swf-version=14 -output build/Android-ARM/FileReaderAPI.swc

unzip -o build/Android-ARM/FileReaderAPI.swc -d build/Android-ARM
rm build/Android-ARM/catalog.xml
mv build/Android-ARM/FileReaderAPI.swc build/

cd build

adt.bat -package -target ane com.cantstopgames.FileReader.ane extension.xml -swc FileReaderAPI.swc -platform Android-ARM -C Android-ARM ReadFileAPI.jar library.swf -platform default -C default/ .

