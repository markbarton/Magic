package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.ToursModel;
	
	public class ToursLoadedSignal extends Signal
	{
		public function ToursLoadedSignal()
		{
			super(ToursModel);
		}
	}
}