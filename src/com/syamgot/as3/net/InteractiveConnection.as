package com.syamgot.as3.net
{
	import flash.events.AsyncErrorEvent;
	import flash.events.EventDispatcher;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;

	/**
	 * InteractiveConnector クラスは、LocalConnection による1対多の双方向通信機能を提供します.
	 * 
	 * @author goto
	 */
	public class InteractiveConnection extends EventDispatcher
	{
		
		/**
		 * InteractiveConnector インスタンスを作成します.
		 * 
		 * @param connectionName 受信用 LocalConnection のコネクション名です.
		 */
		public function InteractiveConnection(connectionName:String = '')
		{
			initialize(connectionName);
		}
		
		/**
		 * InteractiveConnector インスタンスを初期化します.
		 * 
		 * @param connectionName 受信用 LocalConnection のコネクション名です.
		 */
		public function initialize(connectionName:String):void 
		{
			_connectionNames = new Vector.<String>;
			_errorMessage = '';
			
			_reciever = new LocalConnection();
			_sender = new LocalConnection();
			events(_reciever);	
			events(_sender);
			
			if (connectionName != '') 
			{
				connect(connectionName);	
			}
		}
		
		private function events(dispacher:EventDispatcher):void 
		{
			dispacher.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
			dispacher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispacher.addEventListener(StatusEvent.STATUS, statusHandler);
		}
		
		private function asyncErrorHandler(e:AsyncErrorEvent):void 
		{
			_errorMessage = e.text;
			dispatchEvent(e);
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void 
		{
			_errorMessage = e.text;
			dispatchEvent(e);
		}
		
		private function statusHandler(e:StatusEvent):void 
		{
			if (e.level == 'error') 
			{
				_errorMessage = 'LocalConnection.send() failed';
			}
			dispatchEvent(e);
		}
		
		/**
		 * 受信用 LocalConnection を閉じます（切断します）.
		 */
		public function close():void 
		{
			if (isReady()) 
			{
				_reciever.close();
			}
		}
		
		/**
		 * 接続先を指定して、methodName で指定されたメソッドを呼び出します.
		 * 
		 * 送信が成功すれば、 true を返します。
		 * 
		 * @param connectionName
		 * @param methodName
		 * @param args
		 * @return 
		 * @see http://livedocs.adobe.com/flash/9.0_jp/ActionScriptLangRefV3/flash/net/LocalConnection.html#send()
		 */
		public function send(connectionName:String, methodName:String, ...args):Boolean 
		{
			try 
			{
				_sender.send.apply(this, [connectionName, methodName].concat(args));				
			}
			catch (e:Error)
			{
				_errorMessage = e.message;
			}
			
			return false;
		}
		
		/**
		 * addConnectionName() で追加した全ての接続先に対して、methodName で指定されたメソッドを呼び出します.
		 * 
		 * @param methodName
		 * @param args
		 */
		public function sendAll(methodName:String, ...args):void 
		{
			var i:uint, n:uint = _connectionNames.length;
			for (i = 0; i < n; i++) 
			{
				send.apply(this, [_connectionNames[i], methodName].concat(args));
			}
		}
		
		/**
		 * 受信用 LocalConnection インスタンスの接続を行います.
		 * 
		 * 既に受信用 LocalConnection インスタンスが接続されているならば、事前に切断します。
		 * 
		 * @param connectionName 受信用 LocalConnection のコネクション名です.
		 * @return 
		 */
		public function connect(connectionName:String):Boolean 
		{
			close();
			
			if (connectionName != '')
			{
				try 
				{
					_reciever.connect(connectionName);
					_isReady = true;
					return true;
				}
				catch (e:Error)
				{
					_errorMessage = e.message;
				}
			}
			
			return false;
		}
		
		/**
		 * 受信用 LocalConnection の接続が完了しれいれば true を返します.
		 * 
		 * @return 
		 */
		public function isReady():Boolean 
		{
			return _isReady;
		}
		
		/**
		 * 直近のエラーメッセージを返します.
		 * 
		 * @return 
		 */
		public function getErrorMessage():String
		{
			return _errorMessage;
		}
		
		/**
		 * sendAll() メソッドで送信する接続先を追加します.
		 * 
		 * @param args
		 */
		public function addConnectionName(... args):void 
		{
			var i:uint, n:uint = args.length;
			for (i = 0; i < n; i++) 
			{
				_connectionNames.push(args[i]);
			}
		}
		
		private var _isReady:Boolean;
		private var _reciever:LocalConnection;
		private var _sender:LocalConnection;
		private var _errorMessage:String;
		private var _connectionNames:Vector.<String>;
		
		/**
		 * 送信用 LocationConnection インスタンスです.
		 * @return 
		 */
		public function get sender():LocalConnection
		{
			return _sender;
		}
		
		/**
		 * 受信用 LocationConnection インスタンスです.
		 * @return 
		 */
		public function get reciever():LocalConnection
		{
			return _reciever;
		}
		
		/**
		 * コールバックメソッドが呼び出されるオブジェクトを示します.
		 * @return 
		 */
		public function get client():Object
		{
			return _reciever ? _reciever.client : null; 
		}
		
		/**
		 * 
		 * @param value
		 */
		public function set client(value:Object):void 
		{
			if(_reciever) 
			{
				_reciever.client = value;
			}
		}
		
	}
}