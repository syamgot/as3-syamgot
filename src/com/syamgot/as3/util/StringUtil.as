package com.syamgot.as3.util
{
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;

	/**
	 * 文字列のユーティリティ
	 */
	public class StringUtil
	{

		//----------------------------------
		// private properties
		//----------------------------------
		
		// 半角文字列
		private static var HANKAKU:Array = [" ", "!", "%", "&", "'", "(", ")", "*", "+", "-", "/", "_", "~", "#", "\"", ",", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "}", "ｳﾞ", "ｶﾞ", "ｷﾞ", "ｸﾞ", "ｹﾞ", "ｺﾞ", "ｻﾞ", "ｼﾞ", "ｽﾞ", "ｾﾞ", "ｿﾞ", "ﾀﾞ", "ﾁﾞ", "ﾂﾞ", "ﾃﾞ", "ﾄﾞ", "ﾊﾞ", "ﾋﾞ", "ﾌﾞ", "ﾍﾞ", "ﾎﾞ", "ﾊﾟ", "ﾋﾟ", "ﾌﾟ", "ﾍﾟ", "ﾎﾟ", "ｱ", "ｲ", "ｳ", "ｴ", "ｵ", "ｶ", "ｷ", "ｸ", "ｹ", "ｺ", "ｻ", "ｼ", "ｽ", "ｾ", "ｿ", "ﾀ", "ﾁ", "ﾂ", "ﾃ", "ﾄ", "ﾅ", "ﾆ", "ﾇ", "ﾈ", "ﾉ", "ﾊ", "ﾋ", "ﾌ", "ﾍ", "ﾎ", "ﾏ", "ﾐ", "ﾑ", "ﾒ", "ﾓ", "ﾔ", "ﾕ", "ﾖ", "ﾗ", "ﾘ", "ﾙ", "ﾚ", "ﾛ", "ﾜ", "ｦ", "ﾝ", "ｧ", "ｨ", "ｩ", "ｪ", "ｫ", "ｯ", "ｬ", "ｭ", "ｮ", "｢", "｣", "･", "､", "｡", "ｰ", "-", "-", "$", ".", "^", "|",];

		// 正規表現でエスケープしなければならない半角文字列
		private static var HANKAKU_ESCAPE:Array = ["$", ".", "^", "|"];

		//  全角文字列
		private static var ZENKAKU:Array = ["　", "！", "％", "＆", "’", "（", "）", "＊", "＋", /*"－"*/ "\uff0d", "／", "＿",
			/*"～"*/"\uff5e", "＃", "”", "，", "０", "１", "２", "３", "４", "５", "６", "７", "８", "９", "：", "；", "＜", "＝", "＞", "？", "＠", "Ａ", "Ｂ", "Ｃ", "Ｄ", "Ｅ", "Ｆ", "Ｇ", "Ｈ", "Ｉ", "Ｊ", "Ｋ", "Ｌ", "Ｍ", "Ｎ", "Ｏ", "Ｐ", "Ｑ", "Ｒ", "Ｓ", "Ｔ", "Ｕ", "Ｖ", "Ｗ", "Ｘ", "Ｙ", "Ｚ", "［", "￥", "］", "＿", "｀", "ａ", "ｂ", "ｃ", "ｄ", "ｅ", "ｆ", "ｇ", "ｈ", "ｉ", "ｊ", "ｋ", "ｌ", "ｍ", "ｎ", "ｏ", "ｐ", "ｑ", "ｒ", "ｓ", "ｔ", "ｕ", "ｖ", "ｗ", "ｘ", "ｙ", "ｚ", "｛", "｝", "ヴ", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ", "ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ", "ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ワ", "ヲ", "ン", "ァ", "ィ", "ゥ", "ェ", "ォ", "ッ", "ャ", "ュ", "ョ", "「", "」", "・", "、", "。", "ー", "\u2015", "\u2010", "＄", "．", "＾", "｜",];

		//----------------------------------
		// Constant
		//----------------------------------
		/**
		 * 新しい StringUtil() コンストラクタを呼び出すと、ArgumentError 例外がスローされます。
		 * @throws ArgumentError #2012: StringUtil クラスをインスタンス化することはできません。
		 */
		public function StringUtil()
		{
			new ArgumentError('#2012: StringUtil クラスをインスタンス化することはできません。');
		}

		//----------------------------------
		// public methods
		//----------------------------------
		
		/**
		 * 指定文字列が null または空文字列？
		 * @param str	: チェックする文字列
		 * @return
		 */
		public static function isNullOrEmpty(str:String):Boolean
		{
			return str == null || str.length == 0;
		}

		/**
		 * 文字列を置換します。
		 * @param	str 置換対象の文字列。
		 * @param	oldStr 置換される文字列。
		 * @param	newStr 置換する文字列。
		 * @return
		 */
		public static function replace(str:String, oldStr:String, newStr:String):String
		{
			var param:String = "";
			for(var i:uint = 0; i < oldStr.length; i++)
			{
				if(HANKAKU_ESCAPE.indexOf(oldStr.charAt(i)) > -1)
				{
					param += '\\';
				}
				param += oldStr.charAt(i);
			}
			var pattern:RegExp = new RegExp(param, 'g');
			return str.replace(pattern, newStr);
		}

		/**
		 *	文字列の半角文字を全角に変換します。
		 *	@param str	置換の対象となる文字列
		 *	@return 変換実行後の文字列
		 */
		public static function han2zen(str:String):String
		{
			var substr:String = str;
			for(var i:uint = 0; i < HANKAKU.length; i++)
			{
				substr = StringUtil.replace(substr, HANKAKU[i], ZENKAKU[i]);
			}
			return substr;
		}

		/**
		 *	文字列の全角文字を半角に変換します。
		 *	@param str	置換の対象となる文字列
		 *	@return 変換実行後の文字列
		 */
		public static function zen2han(str:String):String
		{
			var substr:String = str;
			for(var i:uint = 0; i < HANKAKU.length; i++)
			{
				substr = StringUtil.replace(substr, ZENKAKU[i], HANKAKU[i]);
			}
			return substr;
		}

		/**
		 * 左右の全角半角空白を削除します。
		 * 第2引数に文字列を指定すれば、その文字列を削除します。
		 * @param str 削除対象の文字列
		 * @return 削除した文字列
		 */
		public static function trim(str:String, param:String = null):String
		{
			str = StringUtil.ltrim(str, param);
			return StringUtil.rtrim(str, param);
		}

		/**
		 * 左側の全角半角空白を削除します。
		 * 第2引数に文字列を指定すれば、その文字列を削除します。
		 * @param str 削除対象の文字列
		 * @return 削除した文字列
		 */
		public static function ltrim(str:String, param:String = null):String
		{
			if(param != null)
			{
				var pattern:RegExp = new RegExp('^' + param, 'g');
				return str.replace(pattern, '');
			}
			else
			{
				return str.replace(/^( |　)+/g, '');
			}
		}

		/**
		 * 右側の全角半角空白を削除します。
		 * 第2引数に文字列を指定すれば、その文字列を削除します。
		 * @param	str 削除対象の文字列
		 * @return	削除した文字列
		 */
		public static function rtrim(str:String, param:String = null):String
		{
			if(param != null)
			{
				var pattern:RegExp = new RegExp(param + '$', 'g');
				return str.replace(pattern, '');
			}
			else
			{
				return str.replace(/( |　)+$/g, '');
			}
		}

		/**
		 * String.match 関数の結果を Boolean で取得します。
		 * @param 	str 照合する文字列です。
		 * @param	pattern 照合するパターンです。String.match と同様に扱われます。
		 * @return	文字列にパターンが含まれているかの判定
		 */
		public static function match(str:String, pattern:*):Boolean
		{
			if(str.match(pattern))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/**
		 * CRLFを削除します。+タブをバックスラッシュ付きの文字列に変更します。
		 *
		 * @param str 文字列
		 * @return 整形した文字列
		 */
		public static function escape(str:String):String
		{
			if(!str)
			{
				return "";
			}

			var escapeStr:String = str;
			escapeStr = escapeStr.replace(/\\/g, "\\\\");
			escapeStr = escapeStr.replace(/\n/g, "\\n");
			escapeStr = escapeStr.replace(/\r/g, "\\r");
			escapeStr = escapeStr.replace(/\t/g, "\\t");
			return escapeStr;
		}

		/**
		 * CRLFを削除します。
		 *
		 * @param str 文字列
		 * @return 整形した文字列
		 */
		private function crlf2empty(str:String):String
		{
			return str.replace(/\r\n/g, "");
		}

		/**
		 * 桁の足りない部分を0で埋めて数字をフォーマット
		 * @param n			フォーマットする数字
		 * @param keta		桁数
		 * @param radix		進数（デフォルトは10進数）
		 * @return			整形した文字列
		 *
		 */
		public static function zeropadding(n:Number, keta:Number, radix:Number = 10):String
		{
			var s:String = n.toString(radix);
			while(s.length < keta)
			{
				s = "0" + s;
			}
			return s;
		}

		/**
		 *
		 * 数字にプラスマイナスつけて文字列で返します
		 * @return
		 *
		 */
		public static function singNum(num:int):String
		{
			var p:String = "";
			if(num > 0)
			{
				p = "+";
			}
			return p + num.toString();
		}

		/**
		 *
		 * sprintf を目指すつもりで
		 *
		 * @param str
		 * @param args
		 * @throw IllegalOperationError
		 * @return
		 *
		 */
		public static function sprintf(str:String, ... args):String
		{

			var reg:RegExp = /%s/g;
			var index:uint;

			if(str.split(/%s/).length - 1 != args.length)
			{
				throw new IllegalOperationError('置換指定文字と置換対象文字の数が一致しません。');
			}

			return str.replace(reg, function():String
			{
				var value:* = args[index];
				index++;
				return value;
			});

		}


		/**
		 * URLから拡張子抜きのファイル名のみを取り出す
		 *
		 */
		public static function getFileNameOnly(url:String):String
		{
			var lastIndex:int = url.lastIndexOf("/");
			return url.substr(lastIndex + 1, url.lastIndexOf(".") - lastIndex - 1);
		}
		
	}
}
