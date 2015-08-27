package com.syamgot.as3.util.logging
{
	
	public class LogRecord
	{
		public function LogRecord(level:int, msg:String)
		{
			_level = level;
			_message = msg;
			_time = new Date().time;
		}
		
		private var _level:int;
		private var _loggerName:String;
		private var _message:String;
		private var _time:Number;
		
		public function get level():int
		{
			return _level;
		}

		public function set level(value:int):void
		{
			_level = value;
		}

		public function get loggerName():String
		{
			return _loggerName;
		}

		public function set loggerName(value:String):void
		{
			_loggerName = value;
		}

		public function get message():String
		{
			return _message;
		}

		public function set message(value:String):void
		{
			_message = value;
		}

		public function get time():Number
		{
			return _time;
		}

		public function set time(value:Number):void
		{
			_time = value;
		}

	}
}