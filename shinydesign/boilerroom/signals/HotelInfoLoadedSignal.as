package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Hotel;
	
	public class HotelInfoLoadedSignal extends Signal
	{
		public function HotelInfoLoadedSignal(...parameters)
		{
			super(Hotel);
		}
	}
}