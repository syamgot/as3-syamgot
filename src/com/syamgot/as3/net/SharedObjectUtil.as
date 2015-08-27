package com.syamgot.as3.net
{
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;

	/**
	 * 
	 * @author syamgot
	 */
	public class SharedObjectUtil extends EventDispatcher
	{
		
		/**
		 *
		 * @param name
		 * @param localPath
		 */
		public function SharedObjectUtil(name:String = 'application', localPath:String = null)
		{
			try
			{
				_so = SharedObject.getLocal(name, localPath);
				if (_so.data == null)
				{
					_so.data;
				}
			}
			catch (e:Error)
			{
				throw e;
			}
		}
	
		/**
		 *
		 * @param name
		 * @return
		 */
		public function get(name:String):Object
		{
			var obj:Object = _so.data[name];
			if (!obj)
			{
				obj = _so.data[name] = {};
			}
			return obj;
		}

		/**
		 *
		 * @param name
		 * @param value
		 * @return
		 */
		public function set(name:String, value:Object):SharedObjectUtil
		{
			_so.data[name] = value;
			return this;
		}

		/**
		 * 
		 *
		 * @param name
		 * @return
		 */
		public function remove(name:String):SharedObjectUtil
		{
			_so.data[name] = null;
			delete _so.data[name];
			return this;
		}

		/**
		 * 
		 * @param diskSpace
		 * @return 
		 * @throws e
		 */
		public function save(diskSpace:int = 0):SharedObjectUtil
		{
			var status:String;

			try
			{
				status = _so.flush(diskSpace);
			}
			catch (e:Error)
			{
				throw e;
			}
			
			if (status == SharedObjectFlushStatus.PENDING)
			{
				_so.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);
			}
			
			return this;
		}

		/**
		 *
		 *
		 * @param event
		 */
		private function statusHandler(event:NetStatusEvent):void
		{
			var code:String = event.info.code;

			if (code == 'SharedObject.Flush.Failed')
			{
				dispatchEvent(event);
			}
		}
		
		private var _so:SharedObject;

	}
}