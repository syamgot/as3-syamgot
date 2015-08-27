package com.syamgot.as3.util.logging
{
	import flash.errors.IllegalOperationError;

	public class Level
	{
		public function Level(level:int):void 
		{
			throw new IllegalOperationError('#2012: Level class cannot be instantiated.');
		}
		
		public static const OFF:int 	= int.MAX_VALUE; 
		public static const SEVERE:int 	= 1000; 
		public static const WARNING:int = 900; 
		public static const INFO:int 	= 800; 
		public static const CONFIG:int 	= 700;
		public static const FINE:int 	= 500; 
		public static const FINER:int 	= 400; 
		public static const FINEST:int 	= 300; 
		public static const ALL:int 	= int.MIN_VALUE; 
		
	}
}