package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.LoadAllTemplatesService;
	
	public class LoadAllTemplatesCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllTemplatesService;
		
		override public function execute():void
		{
			trace("Command >> LoadCurrentUser Called");
			service.getDominoData("LoadAllTemplates");
		}
	}
}