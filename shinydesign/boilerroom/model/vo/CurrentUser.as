package shinydesign.boilerroom.model.vo
{
	[Bindable]
	public class CurrentUser
	{
		private var _UserName:String;
		private var _CommonUserName:String
		private var _AccessRoles:Array;
		
		public function get AccessRoles():Array
		{
			return _AccessRoles;
		}

		public function set AccessRoles(value:Array):void
		{
			_AccessRoles = value;
		}

		public function get CommonUserName():String
		{
			return _CommonUserName;
		}

		public function set CommonUserName(value:String):void
		{
			_CommonUserName = value; 
		}

		public function get UserName():String
		{
			return _UserName;
		}

		public function set UserName(value:String):void
		{
			_UserName = value;
		}

	}
}