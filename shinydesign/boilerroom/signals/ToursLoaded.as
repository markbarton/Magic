package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.ToursModel;
	
	public class ToursLoaded extends Signal
	{
		public function ToursLoaded()
		{
			super(ToursModel);
		}
	}
}