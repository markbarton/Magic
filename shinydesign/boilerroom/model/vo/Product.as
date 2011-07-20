package shinydesign.boilerroom.model.vo
{
	public class Product
	{
		private var _ProductName:String;
		
		
		public function get ProductName():String
		{
			return _ProductName;
		}

		public function set ProductName(value:String):void
		{
			_ProductName = value;
		}

	}
}