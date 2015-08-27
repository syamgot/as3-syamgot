package com.syamgot.as3.command
{
	import com.syamgot.as3.util.IIterator;
	import com.syamgot.as3.util.Stack;
	
	/**
	 * MacroCommand クラスは、複数の命令をまとめて実行することができます.
	 * 
	 * @author syamgot
	 */
	public class MacroCommand implements Command
	{
		
		private var _commands:Stack;
		
		/**
		 * 新しい MacroCommand インスタンスを作成します.
		 *  
		 */
		public function MacroCommand()
		{
			_commands = new Stack();
		}
		
		/**
		 * すべての命令を実行します.
		 *  
		 */
		public function execute():void 
		{
			var it:IIterator = _commands.iterator();
			while(it.hasNext()) 
			{
				Command(it.next()).execute();
			}
		}
		
		/**
		 * 新しい命令を追加します. 
		 * 
		 * @param cmd
		 */
		public function append(cmd:Command):MacroCommand 
		{
			if (cmd != this) 
			{
				_commands.push(cmd);	
			}
			return this;
		}
		
		/**
		 * 先頭の命令を削除します. 
		 * 
		 */
		public function undo():void 
		{
			if (!_commands.empty()) 
			{
				_commands.pop();
			}
		}
		
		/**
		 * すべての命令を削除します.
		 *  
		 */
		public function clear():void 
		{
			_commands.clear();
		}
		
		/**
		 * 
		 * 
		 */
		public function remove(cmd:Command):void 
		{
			_commands.remove(cmd);	
		}
		
		/**
		 * 保持しているコマンドリストを返します
		 * 
		 * @return 
		 * 
		 */
		public function items():Stack
		{
			return _commands;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get length():int
		{
			return _commands.length;
		}
			
	}
}