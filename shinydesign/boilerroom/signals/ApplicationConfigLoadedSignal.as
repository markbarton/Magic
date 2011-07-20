package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.ApplicationConfig;
	
	public class ApplicationConfigLoadedSignal extends Signal
	{
		public function ApplicationConfigLoadedSignal()
		{
			super(ApplicationConfig);
		}
	}
}