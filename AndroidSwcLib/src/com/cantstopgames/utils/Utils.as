package com.cantstopgames.utils
{
	import flash.external.ExtensionContext;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;

	public class Utils extends EventDispatcher 
	{
		private static var extContext:ExtensionContext = null;
		
		public static function loadFile(path:String):ByteArray 
		{
			initContext();
			return extContext.call("LoadFile", path) as ByteArray;
		}
		
		public static function getCountry():String
		{
			initContext();
			return extContext.call("GetCountry") as String;
		}
		
		public static function getLanguage():String
		{
			initContext();
			return extContext.call("GetLanguage") as String;
		}
		
		public static function getCurrencyCode():String {
			initContext();
			return extContext.call("GetCurrencyCode") as String;
		}
		
		public static function getCurrencySymbol():String {
			initContext();
			return extContext.call("GetCurrencySymbol") as String;
		}
		
		public static function getGraphicsDeviceName():String {
			initContext();
			return extContext.call("GetGraphicsDeviceName") as String;
		}

		private static function initContext():void
		{
			if (!extContext)
			{
				extContext = ExtensionContext.createExtensionContext("com.cantstopgames.utils", "");
			}
		}

	}
}