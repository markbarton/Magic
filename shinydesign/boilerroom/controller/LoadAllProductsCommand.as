package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.LoadAllProducts;
	import shinydesign.boilerroom.utils.Logger;
	
	public class LoadAllProductsCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllProducts;
		
		[Inject]
		public var log:Logger; //For all logging
		
		override public function execute():void
		{
			log.debug("Command >> LoadAllProducts Called");
			service.getDominoData("LoadAllProducts");
		}
	}
}