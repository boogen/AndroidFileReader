package com.cantstopgames.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	public class RawDataLoader extends EventDispatcher {
		private var stream:FileStream;
		public var content:ByteArray;
		public var name:String;
		
		public function RawDataLoader():void {
		}
		
		public function load(path:String):void {
			var file:File = File.applicationDirectory.resolvePath(path);
			if (file.exists) {
				stream = new FileStream();
				stream.addEventListener(Event.COMPLETE, onLoaded);
				stream.openAsync(file, FileMode.READ);
			}			
			
		}
		
		private function onLoaded(e:Event):void {
			stream.removeEventListener(Event.COMPLETE, onLoaded);
			
			content = new ByteArray();
			stream.readBytes(content);
			stream.close();
			stream = null;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	
	}
}