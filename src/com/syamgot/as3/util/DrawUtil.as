package com.syamgot.as3.util
{
	import flash.display.Graphics;
	import flash.display.Shape;
	
	import mx.messaging.AbstractConsumer;
	
	import org.hamcrest.mxml.object.Null;
	
	/**
	 * 描画関連のユーティリティ
	 * 
	 */
	public class DrawUtil
	{
		/**
		 * 新しい DrawUtil() コンストラクタを呼び出すと、ArgumentError 例外がスローされます。
		 * @throws ArgumentError #2012: DrawUtil クラスをインスタンス化することはできません。
		 */
		public function DrawUtil()
		{
			new ArgumentError('#2012: DrawUtil クラスをインスタンス化することはできません。');
		}
		
		/**
		 * 三角形を描きます
		 * 
		 * @return 
		 */
		public static function triangle(color:Number):Shape
		{
			var shape:Shape=new Shape();
			var g:Graphics = shape.graphics;
			g.beginFill(color);
			var vertices:Vector.<Number>=Vector.<Number>([-8,-8, 8, 0,-8,8]);
			g.drawTriangles(vertices);
			g.endFill();				
			return shape;
		}
		
		/**
		 * 
		 * @param width
		 * @param height
		 * @return 
		 * 
		 */
		public static function transparentRectangle(width:Number, height:Number):Shape
		{
			var shape:Shape=new Shape();
			var g:Graphics = shape.graphics;
			g.beginFill(0xffffff,0.0);
			g.drawRect(0,0,width,height);
			g.endFill();				
			return shape;
		}
		
		/**
		 * 
		 * @param g
		 * @param r 半径
		 * @param start 開始角度
		 * @param end 終了角度
		 * @param x 基準座標
		 * @param y 基準座標
		 * 
		 */
		public static function pie(g:Graphics, r:Number, start:Number, end:Number, x:Number = 0, y:Number = 0):void 
		{
			
			if (start > end) {
				end += 360;
			}

			var increment:Number 	= 0.1;
			var angle:Number 		= start; 
			var wx:Number, wy:Number;
			
			wx = Math.cos(MathUtil.angle2radian(angle)) * r + x;
			wy = Math.sin(MathUtil.angle2radian(angle)) * r + y;
			g.moveTo(wx,wy);
			
			while (angle < end) {
				
				angle += increment;
				wx = Math.cos(MathUtil.angle2radian(angle)) * r + x;
				wy = Math.sin(MathUtil.angle2radian(angle)) * r + y;
				g.lineTo(wx,wy);
				g.moveTo(wx,wy);
				
			}

		}
		
	}
}