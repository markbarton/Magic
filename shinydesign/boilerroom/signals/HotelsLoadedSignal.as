package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.HotelsModel;
	
	public class HotelsLoadedSignal extends Signal
	{
		public function HotelsLoadedSignal(...parameters)
		{
			super(HotelsModel);
		}
	}
}