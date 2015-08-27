package com.syamgot.as3.util
{
	import flash.errors.IllegalOperationError;
	import flash.geom.Point;
	import flash.geom.Rectangle;


	/**
	 * 衝突判定ユーティリティ
	 * 
	 * @author syamgot
	 * 
	 */
	public class CollisionUtil
	{
		public function CollisionUtil()
		{
			throw new IllegalOperationError('CollisionUtil class cannot be instantiated.');
		}
		
		/**
		 * 矩形と矩形が接触していたらtrueを返します.
		 * 
		 * @param rect1
		 * @param rect2
		 * @return 
		 * 
		 */
		public static function rect(rect1:Rectangle, rect2:Rectangle):Boolean
		{
			/* 矩形Ａ */
			var ax:int = rect1.x;            // x 座標
			var ay:int = rect1.y;            // y 座標
			var aw:int = rect1.width;        // 幅
			var ah:int = rect1.height;       // 高さ
			
			/* 矩形Ｂ */
			var bx:int = rect2.x;            // x 座標
			var by:int = rect2.y;            // y 座標
			var bw:int = rect2.width;        // 幅
			var bh:int = rect2.height;       // 高さ
			
			/* 矩形Ａ */
			var a_x_min:int = ax;            // x 座標最小
			var a_y_min:int = ay;            // y 座標最小
			var a_x_max:int = a_x_min + aw;  // x 座標最大
			var a_y_max:int = a_y_min + ah;  // y 座標最大
			
			/* 矩形Ｂ */
			var b_x_min:int = bx;            // x 座標最小
			var b_y_min:int = by;            // y 座標最小
			var b_x_max:int = b_x_min + bw;  // x 座標最大
			var b_y_max:int = b_y_min + bh;  // y 座標最大
		
			return !(a_x_max < b_x_min) && !( b_x_max < a_x_min) && !( a_y_max < b_y_min) && !( b_y_max < a_y_min);

		}
		

		/**
		 * 円と円が接触していればtrueを返します.
		 * 
		 * @param p1
		 * @param r1
		 * @param p2
		 * @param r2
		 * @return 
		 * 
		 */
		public static function circle(p1:Point, r1:Number, p2:Point, r2:Number):Boolean
		{
			return (MathUtil.distP2P(p1,p2) < (r1 + r2));
		}
		
		/**
		 * レイと線分が交差していればtrueを返します.
		 * 
		 * @return 
		 * 
		 */
		public static function ray2line(r:Ray, p1:Point, p2:Point):Boolean
		{
			/*
			// レイと線分の交差座標を求める
			//var t:Number = VectorUtil.aboutT(r,p1,p2);	
			//var p3:Point = new Point((r.x + r.dx * t), (r.y + r.dy * t));
			var p3:Point = new Point(r.x,r.y);

			// 交差座標とp1,p2とのベクトルを求め内積を取る
			var pa:Point = Vector2DUtil.sub(p3,p1);	
			var pb:Point = Vector2DUtil.sub(p3,p2);
			var dp:Number = Vector2DUtil.dotProduct(pa,pb);
			
			// 内積が負であれば交差している
			return (dp < 0);
			*/
			return false;
		}
		
		/**
		 * 線分ABと線分CDが接触していればtrueを返します.
		 * 
		 * ベクトルABに対し、点Cと点Bの内積がともに正数か負数でなければ交差している.
		 * TODO 始点、終点座標も判定しないといけん
		 * 
		 * @return 
		 * 
		 */
		public static function line2line(pA:Point,pB:Point,pC:Point,pD:Point):Boolean
		{
			/*
			var vAB:Point 	= Vector2DUtil.sub(pA,pB); 		// 座標Aから座標Bへのベクトル
			var nvAB:Point 	= Vector2DUtil.normalVector(vAB); // ベクトルABの法線 
			
			var vAC:Point 	= Vector2DUtil.sub(pC,pA); 			// ベクトルAC
			var vAD:Point 	= Vector2DUtil.sub(pD,pA); 			// ベクトルAD
			var dpA:Number 	= Vector2DUtil.dotProduct(nvAB,vAC);
			var dpB:Number 	= Vector2DUtil.dotProduct(nvAB,vAD);
			
			return ((dpA > 0) && !(dpB > 0)) || (!(dpA > 0) && (dpB > 0));
			*/
			return false;

		}
		
		/**
		 * 線分ABと円の衝突判定
		 * 
		 * @param pa 線分の始点
		 * @param pb 線分の終点
		 * @param pc 円の中心
		 * @param r
		 * @return 
		 * 
		 */
		public static function line2circle(pa:Point, pb:Point, pc:Point, r:Number):Boolean
		{
			
			var vS:Vector2D = new Vector2D(pb.x-pa.x, pb.y-pa.y); // 線分の始点から終点へ向かうベクトルS
			var vA:Vector2D = new Vector2D(pc.x-pa.x, pc.y-pa.y); // 線分の始点から円の中心へ向かうベクトルA
			var vB:Vector2D = new Vector2D(pc.x-pb.x, pc.y-pb.y); // 線分の終点から円の中心へ向かうベクトルB
			
			// 
			var d:Number 		= Math.abs(vS.crossProduct(vA) / vS.length); 	// 線分から円の中心までの距離
			var vSc:Vector2D 	= vS.clone().normalize();	
			var vAc:Vector2D 	= vA.clone().normalize();	
			var vBc:Vector2D 	= vB.clone().normalize();	
				
			//判定
			return ((d <= r) && ((vSc.dotProduct(vAc)*vSc.dotProduct(vBc) <= 0) || (r > vA.length || r > vB.length))); 
		}
		
	}

}