package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	public class ContentToBeParsedChangedSignal extends Signal
	{
		public function ContentToBeParsedChangedSignal()
		{
			super(String);
		}
	}
}