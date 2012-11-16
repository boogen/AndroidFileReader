package com.cantstopgames.filereader {
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	public class ImageLoader extends EventDispatcher {
		private var _loader:Loader;
		
		public var name:String;
		public var content:DisplayObject;
		
		public function ImageLoader():void {
		}
		
		public function load(path:String):void {
			if (!_loader) {
				_loader = new Loader();
			}
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_loader.contentLoaderInfo.addEventListener(AsyncErrorEvent.ASYNC_ERROR, onAsyncError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
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
			content = e.target.content;
			dispatchEvent(e);
		}
	
	}
}