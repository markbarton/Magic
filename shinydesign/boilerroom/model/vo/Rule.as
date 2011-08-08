package shinydesign.boilerroom.model.vo
{
	[RemoteClass]
	public class Rule
	{
		private var _NOTEID:String;
		private var _Sequence:Number;
		private var _TextToFind:String;
		private var _ParitalMatch:Boolean;
		private var _PartialEnd:Boolean;
		private var _PartialStart:Boolean;
		private var _CaseSensitive:Boolean;
		private var _TextToReplace:String;
		private var _TransformText:String;
		private var _RuleType:String;
		
		private var _RuleTitle:String;
		private var _RegEx:String;
		private var _InsertTextPosition:String;
		private var _RegExFlags:String;		
		private var _Repeat:Number;
		private var _TruncateType:String;
		private var _TruncateReplace:String;
		private var _TruncateLength:Number;
		private var _TruncatePosition:String;
		
		public const RULE_REGEX:String="RegEx";
		public const RULE_TEXT:String="Text";
		public const RULE_STATIC:String="Static";
		public const RULE_TRUNCATE:String="Truncate";
		

		public function get RuleTitle():String
		{
			return _RuleTitle;
		}

		public function set RuleTitle(value:String):void
		{
			_RuleTitle = value;
		}

		public function get TruncateType():String
		{
			return _TruncateType;
		}

		public function set TruncateType(value:String):void
		{
			_TruncateType = value;
		}

		public function get TruncateReplace():String
		{
			return _TruncateReplace;
		}

		public function set TruncateReplace(value:String):void
		{
			_TruncateReplace = value;
		}

		public function get TruncateLength():Number
		{
			return _TruncateLength;
		}

		public function set TruncateLength(value:Number):void
		{
			_TruncateLength = value;
		}

		public function get TruncatePosition():String
		{
			return _TruncatePosition;
		}

		public function set TruncatePosition(value:String):void
		{
			_TruncatePosition = value;
		}

		public function get Repeat():Number
		{
			return _Repeat;
		}
		
		public function set Repeat(value:Number):void
		{
			_Repeat = value;
		}

		public function get RegExFlags():String
		{
			return _RegExFlags;
		}

		public function set RegExFlags(value:String):void
		{
			_RegExFlags = value;
		}

		public function get RegEx():String
		{
			return _RegEx;
		}

		public function set RegEx(value:String):void
		{
			_RegEx = value;
		}

		public function get InsertTextPosition():String
		{
			return _InsertTextPosition;
		}

		public function set InsertTextPosition(value:String):void
		{
			_InsertTextPosition = value;
		}

		public function get RuleType():String
		{
			return _RuleType;
		}

		public function set RuleType(value:String):void
		{
			_RuleType = value;
		}

		public function get NOTEID():String
		{
			return _NOTEID;
		}

		public function set NOTEID(value:String):void
		{
			_NOTEID = value;
		}

		public function get Sequence():Number
		{
			return _Sequence;
		}

		public function set Sequence(value:Number):void
		{
			_Sequence = value;
		}

		public function get TextToFind():String
		{
			return _TextToFind;
		}

		public function set TextToFind(value:String):void
		{
			_TextToFind = value;
		}

		public function get ParitalMatch():Boolean
		{
			return _ParitalMatch;
		}

		public function set ParitalMatch(value:Boolean):void
		{
			_ParitalMatch = value;
		}

		public function get PartialEnd():Boolean
		{
			return _PartialEnd;
		}

		public function set PartialEnd(value:Boolean):void
		{
			_PartialEnd = value;
		}

		public function get PartialStart():Boolean
		{
			return _PartialStart;
		}

		public function set PartialStart(value:Boolean):void
		{
			_PartialStart = value;
		}

		public function get CaseSensitive():Boolean
		{
			return _CaseSensitive;
		}

		public function set CaseSensitive(value:Boolean):void
		{
			_CaseSensitive = value;
		}

		public function get TextToReplace():String
		{
			return _TextToReplace;
		}

		public function set TextToReplace(value:String):void
		{
			_TextToReplace = value;
		}

		public function get TransformText():String
		{
			return _TransformText;
		}

		public function set TransformText(value:String):void
		{
			_TransformText = value;
		}

		
		public static const TRANSFORM_UPPERCASE:String="Uppercase";
		public static const TRANSFORM_LOWERCASE:String="Lowercase";
		public static const TRANSFORM_PROPERCASE:String="Propercase";
		
		public function Rule()
		{
		}
	}
}