package shinydesign.boilerroom.model.vo
{
	public class LoadingFrame
	{
		private var _frameIdentifier:String;
		private var _state:String;

		public function get frameIdentifier():String
		{
			return _frameIdentifier;
		}

		public function set frameIdentifier(value:String):void
		{
			_frameIdentifier = value;
		}

		public function get state():String
		{
			return _state;
		}

		public function set state(value:String):void
		{
			_state = value;
		}

		//State Constants
		public const NORMAL_STATE:String="normal";
		public const LOADING_STATE:String="loading";
		public const DATA_LOADED:String="dataLoaded";
		public const DATA_ERROR:String="error";
		
		//Frame Constants - static so we dont need to instantiate this class
		public static const FRAME_ALL_HOTELS:String="AllHotels";
		public static const FRAME_ALL_TOURS:String="AllTours";
		public static const FRAME_TOUR_INFO:String="TourInfo";
		public static const FRAME_HOTEL_INFO:String="HotelInfo";
		
		public function LoadingFrame()
		{
		}
	}
}