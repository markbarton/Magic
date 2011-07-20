package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Tour;
	
	public class TourInfoLoadedSignal extends Signal
	{
		public function TourInfoLoadedSignal()
		{
			super(Tour);
		}
	}
}