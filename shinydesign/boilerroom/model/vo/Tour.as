package shinydesign.boilerroom.model.vo
{
	[Bindable]
	public class Tour
	{
		private var _Continent:String;
		private var _Country:String;
		private var _Title:String;
		private var _StartPoint:String;
		private var _UNID:String;
		private var _Thumbnail:String;
		private var _MainImage:String;
		private var _Intro:String;
		private var _TourStyle:String;
		private var _Itinerary:String;
		private var _Inclusions:String;
		private var _Extras:String;
		private var _Highlights:String;
		private var _Duration:String;
		private var _GBP:String;
		private var _EUR:String;
		private var _AUD:String;
		
		public function get AUD():String
		{
			return _AUD;
		}

		public function set AUD(value:String):void
		{
			_AUD = value;
		}

		public function get EUR():String
		{
			return _EUR;
		}

		public function set EUR(value:String):void
		{
			_EUR = value;
		}

		public function get GBP():String
		{
			return _GBP;
		}

		public function set GBP(value:String):void
		{
			_GBP = value;
		}

		public function get Duration():String
		{
			return _Duration;
		}

		public function set Duration(value:String):void
		{
			_Duration = value;
		}

		public function get Highlights():String
		{
			return _Highlights;
		}

		public function set Highlights(value:String):void
		{
			_Highlights = value;
		}

		public function get MainImage():String
		{
			return _MainImage;
		}

		public function set MainImage(value:String):void
		{
			_MainImage = value;
		}

		public function get StartPoint():String
		{
			return _StartPoint;
		}

		public function set StartPoint(value:String):void
		{
			_StartPoint = value;
		}

		public function get Extras():String
		{
			return _Extras;
		}

		public function set Extras(value:String):void
		{
			_Extras = value;
		}

		public function get Inclusions():String
		{
			return _Inclusions;
		}

		public function set Inclusions(value:String):void
		{
			_Inclusions = value;
		}

		public function get Itinerary():String
		{
			return _Itinerary;
		}

		public function set Itinerary(value:String):void
		{
			_Itinerary = value;
		}

		public function get TourStyle():String
		{
			return _TourStyle;
		}

		public function set TourStyle(value:String):void
		{
			_TourStyle = value;
		}

		public function get Intro():String
		{
			return _Intro;
		}

		public function set Intro(value:String):void
		{
			_Intro = value;
		}

		public function get Thumbnail():String
		{
			return _Thumbnail;
		}

		public function set Thumbnail(value:String):void
		{
			_Thumbnail = value;
		}

		public function get UNID():String
		{
			return _UNID;
		}

		public function set UNID(value:String):void
		{
			_UNID = value;
		}

		public function get Title():String
		{
			return _Title;
		}

		public function set Title(value:String):void
		{
			_Title = value;
		}

		public function get Country():String
		{
			return _Country;
		}

		public function set Country(value:String):void
		{
			_Country = value;
		}

		public function get Continent():String
		{
			return _Continent;
		}

		public function set Continent(value:String):void
		{
			_Continent = value;
		}

	}
}