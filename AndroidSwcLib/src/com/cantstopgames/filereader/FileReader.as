package com.cantstopgames.filereader
{
	import flash.external.ExtensionContext;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;

	public class FileReader extends EventDispatcher 
	{
		private static var extContext:ExtensionContext = null;
		
		public static function loadFile(path:String):ByteArray 
		{
			initContext();
			return extContext.call("LoadFile", path) as ByteArray;
		}

		private static function initContext():void
		{
			if (!extContext)
			{
				extContext = ExtensionContext.createExtensionContext("com.cantstopgames.FileReader", "");
			}
		}

	}
}