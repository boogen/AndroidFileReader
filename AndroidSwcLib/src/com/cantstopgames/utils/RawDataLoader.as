package com.cantstopgames.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	public class RawDataLoader extends EventDispatcher {
		public var content:ByteArray;
		public var name:String;
		
		public function RawDataLoader():void {
		}
		
		public function load(path:String):void {
			content = Utils.loadFile(path);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	
	}
}