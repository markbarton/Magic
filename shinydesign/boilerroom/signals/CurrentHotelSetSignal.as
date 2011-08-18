package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Hotel;
	
	public class CurrentHotelSetSignal extends Signal
	{
		public function CurrentHotelSetSignal(...parameters)
		{
			super(Hotel);
		}
	}
}