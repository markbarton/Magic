package shinydesign.boilerroom.model
{
	import mx.collections.ArrayCollection;
	
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.signals.CurrentHotelSetSignal;

	public class HotelsModel
	{
		[Inject]
		public var currentHotelSetSignal:CurrentHotelSetSignal;
		
		private var _CurrentHotel:Hotel;
		private var _Hotels:ArrayCollection=new ArrayCollection;

		public function get CurrentHotel():Hotel
		{
			return _CurrentHotel;
		}

		public function set CurrentHotel(value:Hotel):void
		{
			_CurrentHotel = value;
			currentHotelSetSignal.dispatch(value);
		}

		public function get Hotels():ArrayCollection
		{
			return _Hotels;
		}

		public function set Hotels(value:ArrayCollection):void
		{
			_Hotels = value;
		}

		
		
		
	}
}