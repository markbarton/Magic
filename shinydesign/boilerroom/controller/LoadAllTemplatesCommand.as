package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.LoadAllTemplatesService;
	import shinydesign.boilerroom.utils.Logger;
	
	public class LoadAllTemplatesCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllTemplatesService;
		
		[Inject]
		public var log:Logger; //For all logging
		
		override public function execute():void
		{
			log.debug("Command >> LoadCurrentUser Called");
			service.getDominoData("LoadAllTemplates");
		}
	}
}