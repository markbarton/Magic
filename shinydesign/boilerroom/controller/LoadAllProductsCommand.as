package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.LoadAllProducts;
	
	public class LoadAllProductsCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllProducts;
		
		override public function execute():void
		{
			trace("Command >> LoadAllProducts Called");
			service.getDominoData("LoadAllProducts");
		}
	}
}