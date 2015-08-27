package com.syamgot.as3.util
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * 
	 * @author syamgot
	 */
	public class EventUtil
	{
		public function EventUtil()
		{
			throw new IllegalOperationError('#2012: EventUtil class cannot be instantiated.');
		}
		
		/**
		 * 1度だけ実行するイベントハンドラを返します。
		 * 
		 * @param eventHandler
		 * @param useCapture
		 * @return イベントハンドラ
		 */
		public static function eventAtOnce(eventHandler:Function
												  , useCapture:Boolean = false):Function
		{
			return function(e:Event):void {
				
				var tgt:EventDispatcher = e.target as EventDispatcher;
				tgt.removeEventListener(e.type, arguments.callee);
				eventHandler(e);	
				
			}
		}
		
	}
}