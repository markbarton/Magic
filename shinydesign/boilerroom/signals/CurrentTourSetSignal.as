package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Tour;
	
	public class CurrentTourSetSignal extends Signal
	{
		public function CurrentTourSetSignal()
		{
			super(Tour);
		}
	}
}