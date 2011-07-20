package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	
	public class ProcessContentSignal extends Signal
	{
		public function ProcessContentSignal()
		{
			//Will be passed the content to process & template to use
			super(TemplatesModel);
		}
	}
}