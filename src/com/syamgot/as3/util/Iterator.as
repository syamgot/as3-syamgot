package com.syamgot.as3.util
{
	/**
	 * Iterator クラスは、Collection の反復子です.
	 * 
	 * @author syamgot
	 */
	public class Iterator implements IIterator
	{
		private var _collection:Collection;
		private var _index:uint;
		
		/**
		 * 新しい Iterator インスタンスを作成します.
		 * 
		 * @param collection
		 */
		public function Iterator(collection:Collection)
		{
			_collection = collection;
			_index = 0;
		}
		
		/**
		 * 繰り返し処理でさらに要素がある場合に true を返します.
		 * @return 
		 */
		public function hasNext():Boolean
		{
			return _index < _collection.length ? true : false; 
		}
		
		/**
		 * 繰り返し処理で次の要素を返します.
		 * @return 
		 */
		public function next():Object
		{
			var item:Object = _collection.getAt(_index);
			_index++;
			return item;
		}
		
	}
}