package com.cantstopgames.filereader {
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class XmlLoader extends EventDispatcher {
		private const CHAR_SET:String = "iso-8859-1";
		private var _byteArray:ByteArray;
		
		public var name:String;
		public var content:XML;
		
		public function XmlLoader():void {
		}
		
		public function load(path:String):void {
			_byteArray = FileReader.loadFile(path);
			
			var s:String = _byteArray.readMultiByte(_byteArray.bytesAvailable, CHAR_SET);
			content = new XML(s);			
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	
	}
}