package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	
	//This command is triggered when the content to be parsed has been updated
	
	public class UpdateContentCommand extends SignalCommand
	{
		[Inject]
		public var templatesModel:TemplatesModel;
		
		[Inject]
		public var content:String; //from the signal
		
		
		//Call the process template class
		override public function execute():void{
			trace("UpdateContentCommand >> "+ content);
			templatesModel.Content=content;		
			}
	}
}