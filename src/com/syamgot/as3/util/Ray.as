package com.syamgot.as3.util
{
	public class Ray
	{
		public function Ray(x:Number, y:Number, dx:Number, dy:Number) 
		{
			this.x 	= x;
			this.y 	= y;
			this.dx = dx;
			this.dy = dy;
		}
		public var x:Number;
		public var y:Number;
		public var dx:Number;
		public var dy:Number;

		public function toString():String
		{
			var str:String = '';
			str += 'x:'+x+' ';
			str += 'y:'+y+' ';
			str += 'dx:'+dx+' ';
			str += 'dy:'+dy+' ';
			return str;
		}

	}
}