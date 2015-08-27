package com.syamgot.as3.util
{
	import flash.geom.Point;

	public class Vector2D
	{

		/**
		 * 新しい Vector2D インスタンスを返します.
		 * 
		 * @param x
		 * @param y
		 * 
		 */
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			this.x = x;
			this.y = y;
		}

		/**
		 * 加算結果を新しい Vector2D インスタンスとして返します.
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public function add(v2d:Vector2D):Vector2D
		{
			return new Vector2D(x+v2d.x, y+v2d.y);
		}
		
		/**
		 * 減産結果を新しい Vector2D インスタンスとして返します.
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public function sub(v2d:Vector2D):Vector2D
		{
			return new Vector2D(x-v2d.x, y-v2d.y);
		}
		
		/**
		 * 拡大します
		 * 
		 * @param scale
		 * @return 
		 * 
		 */
		public function scaleBy(scale:Number):Vector2D
		{
			x *= scale;
			y *= scale;
			return this;
		}
		
		/**
		 * 正規化します.
		 * 
		 * @return 
		 * 
		 */
		public function normalize():Vector2D
		{
			var len:Number = 1/this.length;
			x *= len;
			y *= len;
			return this;	
		}
		
		/**
		 * ベクトルを反転させます.
		 * 
		 * @return 
		 * 
		 */
		public function negate():Vector2D
		{
			x *= -1;	
			y *= -1;	
			return this;	
		}
		
		/**
		 * 法線になる新しい Vector2D インスタンスを返します.
		 * 
		 * @return 
		 * 
		 */
		public function normalVector():Vector2D
		{
			return new Vector2D(y*-1,x);	
		}
		
		/**
		 * 内積を返します.
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public function dotProduct(v2d:Vector2D):Number
		{
			return (x * v2d.x) + (y * v2d.y);	
		}
		
		/**
		 * 外積を返します.
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public function crossProduct(v2d:Vector2D):Number
		{
			 return x * v2d.y - v2d.x * y;
		}
		
		/**
		 * 与えられた Vector2D インスタンスとの角度を返します.
		 * 
		 * 2つのベクトルの最短の角度を求めます.
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public function angleBetween(v2d:Vector2D):Number
		{
			var cos:Number = dotProduct(v2d) / ( length * v2d.length );
			var rad:Number = Math.acos( cos );	
			return rad * 180.0 / Math.PI;			
		}
		
		/**
		 * 角度で回転させます.
		 * 
		 * <pre>
		 * x' = x * cosθ - y * sinθ
		 * y' = x * sinθ + y * cosθ
		 * </pre>
		 * 
		 * @param angle
		 * @return 
		 * 
		 */
		public function rotate(angle:Number):Vector2D
		{
			var radian:Number = MathUtil.angle2radian(angle);
			var x2:Number = x * Math.cos(radian) - y * Math.sin(radian);
			var y2:Number = x * Math.sin(radian) + y * Math.cos(radian);
			_x = x2;
			_y = y2;
			return this;	
		}
		
		/**
		 * 滑りベクトルになる新しい Vector2D インスタンスを返します.
		 * 
		 * 
		 * F 進行ベクトル
		 * N 壁になるベクトルの法線(正規化)
		 * P 滑りベクトル
		 * 
		 * P=F+(−F⋅N)N
		 * 
		 * @return 
		 * 
		 */
		public function slide(v2d:Vector2D):Vector2D 
		{
			var n:Vector2D = v2d.normalVector().normalize();
			var d:Number = this.clone().negate().dotProduct(n);
			return n.scaleBy(d).add(this);
		}
		
		/**
		 * 
		 * 
		 * R=F+2(−F⋅N)N
		 * 
		 * @return 
		 * 
		 */
		public function reflect(v2d:Vector2D):Vector2D
		{
			var n:Vector2D = v2d.normalVector().normalize();
			var d:Number = this.clone().negate().dotProduct(n);
			return n.scaleBy(d).scaleBy(2).add(this);
		}

		/**
		 * 始点(0,0)からのベクトルの長さを返します.
		 * 
		 * @return 
		 * 
		 */
		public function get length():Number
		{
			return Math.sqrt(x * x + y * y);	
		}
		
		/**
		 * 角度を返します.
		 * 
		 * @return 
		 * 
		 */
		public function get angle():Number
		{
			return Math.atan2(y,x) * 180 / Math.PI;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function toString():String
		{
			var str:String = '';
			str += 'x ' + _x.toFixed(3) + ', ';
			str += 'y ' + _y.toFixed(3) + ', ';
			str += 'length ' + length.toFixed(3) + ' ';
			str += 'angle ' + angle.toFixed(3) + ' ';
			return str;	
		}
		
		/**
		 * クローン 
		 * 
		 * @return 
		 * 
		 */
		public function clone():Vector2D
		{
			return new Vector2D(x,y);	
		}
		
		
		private var _x:Number;

		public function get x():Number
		{
			return _x;
		}

		public function set x(value:Number):void
		{
			_x = value;
		}

		private var _y:Number;

		public function get y():Number
		{
			return _y;
		}

		public function set y(value:Number):void
		{
			_y = value;
		}

	}
}