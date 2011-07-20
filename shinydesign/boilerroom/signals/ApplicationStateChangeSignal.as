package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	public class ApplicationStateChangeSignal extends Signal
	{
		public function ApplicationStateChangeSignal()
		{
			super(String);
		}
	}
}