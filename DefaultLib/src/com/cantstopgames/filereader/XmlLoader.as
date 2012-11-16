package com.cantstopgames.filereader {
	import flash.display.DisplayObject;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class XmlLoader extends EventDispatcher {
		private var _loader:URLLoader;
		
		public var name:String;
		public var content:XML;
		
		public function XmlLoader():void {
		}
		
		public function load(path:String):void {
			if (!_loader) {
				_loader = new URLLoader();
			}
			
			_loader.addEventListener(Event.COMPLETE, onComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_loader.addEventListener(AsyncErrorEvent.ASYNC_ERROR, onAsyncError);
			_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_loader.load(new URLRequest(path));
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void {
			dispatchEvent(e);
		}
		
		private function onAsyncError(e:AsyncErrorEvent):void {
			dispatchEvent(e);
		}
		
		private function onIOError(e:IOErrorEvent):void {
			dispatchEvent(e);
		}
		
		private function onComplete(e:Event):void {
			content = new XML(_loader.data);
			dispatchEvent(e);
		}	
	}
}