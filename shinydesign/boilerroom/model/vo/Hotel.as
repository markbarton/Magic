package shinydesign.boilerroom.model.vo
{
	[Bindable]
	public class Hotel
	{
		private var _Continent:String;
		private var _Country:String;
		private var _Town:String;
		private var _Region:String;
private var _Thumbnail:String;
private var _UNID:String;
private var _Website:String;
private var _Description:String;
private var _Highlights:String;
private var _Board:String;

		public function get Website():String
		{
			return _Website;
		}

		public function set Website(value:String):void
		{
			_Website = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get Highlights():String
		{
			return _Highlights;
		}

		public function set Highlights(value:String):void
		{
			_Highlights = value;
		}

		public function get Board():String
		{
			return _Board;
		}

		public function set Board(value:String):void
		{
			_Board = value;
		}



		public function get UNID():String
		{
			return _UNID;
		}

		public function set UNID(value:String):void
		{
			_UNID = value;
		}



		public function get Thumbnail():String
		{
			return _Thumbnail;
		}

		public function set Thumbnail(value:String):void
		{
			_Thumbnail = value;
		}


		public function get Region():String
		{
			return _Region;
		}

		public function set Region(value:String):void
		{
			_Region = value;
		}


		private var _HotelName:String;
		private var _StarRating:String;
		private var _SupplierCode:String;

		public function get Continent():String
		{
			return _Continent;
		}

		public function set Continent(value:String):void
		{
			_Continent = value;
		}

		public function get Country():String
		{
			return _Country;
		}

		public function set Country(value:String):void
		{
			_Country = value;
		}

		public function get Town():String
		{
			return _Town;
		}

		public function set Town(value:String):void
		{
			_Town = value;
		}

		public function get HotelName():String
		{
			return _HotelName;
		}

		public function set HotelName(value:String):void
		{
			_HotelName = value;
		}

		public function get StarRating():String
		{
			return _StarRating;
		}

		public function set StarRating(value:String):void
		{
			_StarRating = value;
		}

		public function get SupplierCode():String
		{
			return _SupplierCode;
		}

		public function set SupplierCode(value:String):void
		{
			_SupplierCode = value;
		}

		
		public function Hotel()
		{
		}
	}
}