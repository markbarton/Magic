package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.vo.Template;
	
	//This class will take the signal whoich contains a template which has been dragged from the unselected list to the selected list
	
	public class UpdateSelectedTemplateCommand extends SignalCommand
	{
		[Inject]
		public var templatesModel:TemplatesModel;
		
		[Inject]
		public var template:Template; //from signal
		
		[Inject]
		public var added:Boolean; //whether the template is being added or removed (from the signal)
		
		
		//Call the process template class
		override public function execute():void{
			trace("UpdateSelectedTemplateCommand>>");
			if(added)
			templatesModel.AddSelectedTemplate(template);
			else
			templatesModel.RemoveSelectedTemplate(template);	
		}
	}
}