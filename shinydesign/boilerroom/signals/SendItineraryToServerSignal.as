package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	public class SendItineraryToServerSignal extends Signal
	{
		public function SendItineraryToServerSignal()
		{
			super(String);
		}
	}
}