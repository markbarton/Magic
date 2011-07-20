package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	
	public class TemplatesLoadedSignal extends Signal
	{
		public function TemplatesLoadedSignal()
		{
			super(TemplatesModel);
		}
	}
}