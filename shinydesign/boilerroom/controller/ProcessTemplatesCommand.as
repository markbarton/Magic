package shinydesign.boilerroom.controller
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.utils.ProcessTemplates;
	
	public class ProcessTemplatesCommand extends SignalCommand
	{
		[Inject]
		public var templatesModel:TemplatesModel; //Model will be passed via Signal
		
		[Inject]
		public var contentProcessed:ContentProcessedSignal; //Signal to pass to ProcessTemplates Method
		
		[Inject]
		public var log:Logger; //For all logging
		//Call the process template class
		override public function execute():void
		{
			trace("Command >> Process Templates Command Called");
			var process:ProcessTemplates=new ProcessTemplates();
			//Inject Signal here
			process.contentProcessed=contentProcessed;
			process.log=log;
			process.Templates=templatesModel.SelectedTemplateList;
			process.processContentWithSignal(templatesModel.Content);
			
		}
	}
}