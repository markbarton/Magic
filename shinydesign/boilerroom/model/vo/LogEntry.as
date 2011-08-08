package shinydesign.boilerroom.model.vo
{
	import mx.formatters.DateFormatter;

	public class LogEntry
	{
		private var df:DateFormatter;
		
		public function LogEntry():void{
			df = new DateFormatter();
			df.formatString = "HH:NN:SS";
			time=df.format(new Date());
		}
		
		
		
		public var index:Number;
		public var flashTime:Number;
		public var time:String;
		public var message:String;
		private var _level:Number;
		public var typeLevel:String;
		public var category:String;
		
		public function get level():Number
		{
			return _level;
		}

		public function set level(value:Number):void
		{
			_level = value;
			typeLevel=getTypeNameForLevel(value);
		}

		/**
		 * Get label for level
		 */
		protected function getTypeNameForLevel(level:int):String
		{
			var typeLabel:String = "";
			switch(level)
			{
				case 1:
					typeLabel = "DEBUG";
					break;
				case 2:
					typeLabel = "INFO";
					break;
				case 4:
					typeLabel = "WARN";
					break;
				case 8:
					typeLabel = "ERROR";
					break;
				default:
			}
			typeLevel=typeLabel;
			return typeLabel;
		}
	}
}