package shinydesign.boilerroom.controller
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.utils.ProcessTemplates;
	
	public class ProcessTemplatesCommand extends SignalCommand
	{
		[Inject]
		public var templatesModel:TemplatesModel; //Model will be passed via Signal
		
		[Inject]
		public var contentProcessed:ContentProcessedSignal; //Signal to pass to ProcessTemplates Method
		
		//Call the process template class
		override public function execute():void
		{
			trace("Command >> Process Templates Command Called");
			var process:ProcessTemplates=new ProcessTemplates();
			//Inject Signal here
			process.contentProcessed=contentProcessed;
			process.Templates=templatesModel.SelectedTemplateList;
			process.processTest(templatesModel.Content);
			
		}
	}
}