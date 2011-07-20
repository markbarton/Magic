package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.LoadAllToursService;
	
	public class LoadProductCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllToursService;
		
		override public function execute():void
		{
			trace("Command >> LoadProductCommand Called");
			service.getDominoData("LoadAllTours");
		}
	}
}