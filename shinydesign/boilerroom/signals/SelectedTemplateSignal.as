package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Template;
	
	public class SelectedTemplateSignal extends Signal
	{
		public function SelectedTemplateSignal(	)	
		{
			super(Template,Boolean);
		}
	}
}