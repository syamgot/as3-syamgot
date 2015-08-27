package com.syamgot.as3.util
{
	import flash.errors.IllegalOperationError;

	public class DateUtil
	{
		
		public function DateUtil()
		{
			throw new IllegalOperationError('#2012: DataUtil class cannot be instantiated.');
		}
	
		private static var E:Array = ['SON', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
		private static var MMM:Array = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		
		/**
		 * @param Date date
		 * @param String format yyyy-MM-dd HH:mm:ss.SSS
		 */
		public static function format(date:Date, format:String = 'yyyy-MM-dd HH:mm:ss.SSS'):String
		{
			return format
				.replace(/(yyyy)/g	, date.fullYear)
				.replace(/(MMM)/g	, MMM[date.month])
				.replace(/(MM)/g	, (date.month + 1))
				.replace(/(dd)/g	, date.date)
				.replace(/(HH)/g	, date.hours)
				.replace(/(mm)/g	, date.minutes)
				.replace(/(ss)/g	, date.seconds)
				.replace(/(SSS)/g	, date.milliseconds)
				.replace(/(E)/g 	, E[date.day]);
		}
		
	}
}