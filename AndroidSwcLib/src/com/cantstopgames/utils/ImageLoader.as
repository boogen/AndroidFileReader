package com.cantstopgames.utils {
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class ImageLoader extends EventDispatcher {
		private var _loader:Loader;
		private var _byteArray:ByteArray;
		
		public var name:String;
		public var content:DisplayObject;
		
		public function ImageLoader():void {
		}
		
		public function load(path:String):void {
			_byteArray = Utils.loadFile(path);
			
			
			if (!_loader) {
				_loader = new Loader();
			}
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_loader.contentLoaderInfo.addEventListener(AsyncErrorEvent.ASYNC_ERROR, onAsyncError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_loader.loadBytes(_byteArray);
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void {
			cleanup();
			dispatchEvent(e);
		}
		
		private function onAsyncError(e:AsyncErrorEvent):void {
			cleanup();
			dispatchEvent(e);
		}
		
		private function onIOError(e:IOErrorEvent):void {
			cleanup();
			dispatchEvent(e);
		}
		
		private function onComplete(e:Event):void {
			content = e.target.content;
			cleanup();
			dispatchEvent(e);
		}
		
		private function cleanup():void {
			if (_byteArray) {
				_byteArray.clear();
				_byteArray = null;
			}
		}
	
	}
}