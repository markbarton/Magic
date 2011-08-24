package shinydesign.boilerroom.model.vo
{
	public class Allocation
	{
		private var _hasAllocation:Boolean;
		private var _hasMulti:Boolean;
		private var _cruiseLines:String; //Holds a string list of Cruise Lines if there are more than 1 cruise line 
		private var _allocationType:String;
		private var _matchingKey:String
		
		public function Allocation()
		{
		}

		public function get matchingKey():String
		{
			return _matchingKey;
		}

		public function set matchingKey(value:String):void
		{
			_matchingKey = value;
		}

		public function get allocationType():String
		{
			return _allocationType;
		}

		public function set allocationType(value:String):void
		{
			_allocationType = value;
		}

		public function get cruiseLines():String
		{
			return _cruiseLines;
		}

		public function set cruiseLines(value:String):void
		{
			_cruiseLines = value;
		}

		public function get hasMulti():Boolean
		{
			return _hasMulti;
		}

		public function set hasMulti(value:Boolean):void
		{
			_hasMulti = value;
		}

		public function get hasAllocation():Boolean
		{
			return _hasAllocation;
		}

		public function set hasAllocation(value:Boolean):void
		{
			_hasAllocation = value;
		}

	}
}