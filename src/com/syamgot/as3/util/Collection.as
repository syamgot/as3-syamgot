package com.syamgot.as3.util
{

	/**
	 *  
	 * 
	 * @author syamgot
	 */
	public class Collection implements ICollection
	{
		
		private var _items:Vector.<Object>;
		
		/**
		 * 新しい Collection インスタンスを作成します. 
		 */
		public function Collection()
		{
			_items = new Vector.<Object>;
		}
		
		/**
		 * コレクションを操作するイテレータを返します.
		 * 
		 * @return 
		 */
		public function iterator():IIterator
		{
			return new Iterator(this);
		}
		
		/**
		 * コレクションのサイズを返します.
		 * 
		 * @return 
		 */
		public function get length():uint
		{
			return _items.length;
		}
		
		/**
		 * 指定したインデックスの要素を返します.
		 * 
		 * @param index
		 * @return 
		 */
		public function getAt(index:uint):Object
		{
			return _items[index];
		}
		
		/**
		 * 要素をコレクションの最後に追加します.
		 *  
		 * @param item
		 */
		public function add(... args):void
		{
			for each (var item:Object in args) 
			{
				_items.push(item);
			}
		}
		
		/**
		 * 指定されたインデックスに、要素を追加します.
		 *  
		 * @param item
		 * @param index
		 */
		public function addAt(item:Object, index:uint):void
		{
			if (index > length) 
			{
				_items.fixed = false;
				_items.length = index + 1;
			}
			_items[index] = item;
		}
		
		/**
		 * 指定された要素がコレクションに存在すれば、その要素を削除します. 
		 * 
		 * @param item
		 */
		public function remove(item:Object):void 
		{
			var idx:int = _items.indexOf(item);
			if (idx > -1) { _items.splice(idx, 1); }
		}
		
		/**
		 * 指定されたインデックスの要素を削除します. 
		 * 
		 * @param index
		 */
		public function removeAt(index:uint):void 
		{
			if (index < length) 
			{
				_items.splice(index, 1);	
			}
		}
		
		/**
		 * コレクションに要素がなければ true を返します.
		 * 
		 * @return 
		 */
		public function empty():Boolean
		{
			return _items.length == 0 ? true : false;
		}
	
		/**
		 * すべての要素を削除します.
		 *  
		 */
		public function clear():void 
		{
			_items = new Vector.<Object>;
		}
		
		/**
		 * 文字列表現です.
		 * 
		 * @return 
		 */
		public function toString():String
		{
			return _items.toString();
		}
	}
}