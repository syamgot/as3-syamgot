package com.syamgot.as3.util
{
	import flash.display.Graphics;
	import flash.errors.IllegalOperationError;
	import flash.geom.Point;

	/**
	 * Vector2Dユーティリティ
	 * 
	 * 
	 * @author syamgot
	 * 
	 */
	public class Vector2DUtil
	{

		/**
		 * 
		 * 
		 */
		public function Vector2DUtil()
		{
			throw new IllegalOperationError('VectorUtil class cannot be instantiated.');
		}
		
		
		/**
		 * 始点と終点を指定して、Vector2D インスタンスを生成します.
		 * 
		 * @param start
		 * @param end
		 * @return 
		 * 
		 */
		public static function createByPoints(start:Point, end:Point):Vector2D
		{
			return new Vector2D(end.x-start.x,end.y-start.y);	
		}
		
		/**
		 * ベクトルを描画する
		 * 
		 * @param v2d
		 * @return 
		 * 
		 */
		public static function draw(v2d:Vector2D, g:Graphics, p:Point = null, arrow:Boolean = true):void
		{
			
			if (p === null) {
				p = new Point();
			}

			g.moveTo(p.x,p.y);
			g.lineTo(p.x+v2d.x,p.y+v2d.y);
			
			if (arrow) {

				var s:Number = v2d.length/5;
				s = s > 10 ? 10 : s;
				
				var vc:Vector2D = v2d.clone().negate().normalize().scaleBy(s);
	
				var va:Vector2D = vc.clone().rotate(30);
				g.moveTo(p.x+v2d.x,p.y+v2d.y);
				g.lineTo(p.x+v2d.x+va.x,p.y+v2d.y+va.y);
	
				var vb:Vector2D = vc.clone().rotate(-30);
				g.moveTo(p.x+v2d.x,p.y+v2d.y);
				g.lineTo(p.x+v2d.x+vb.x,p.y+v2d.y+vb.y);
				
			}

		}
		

	}

}