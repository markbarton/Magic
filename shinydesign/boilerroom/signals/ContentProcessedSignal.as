package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	//Used to transmit content which has been processed through the templates & rules
	public class ContentProcessedSignal extends Signal
	{
		public function ContentProcessedSignal()
		{
			super(String);
		}
	}
}