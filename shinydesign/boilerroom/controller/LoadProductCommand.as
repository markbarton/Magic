package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.services.dominodata.LoadAllHotels;
	import shinydesign.boilerroom.services.dominodata.LoadAllToursService;
	import shinydesign.boilerroom.signals.LoadingFrameSignal;
	import shinydesign.boilerroom.utils.Logger;
	
	public class LoadProductCommand extends SignalCommand
	{
		[Inject]
		public var service:LoadAllToursService;
		[Inject]
		public var hotelsService:LoadAllHotels;
		
		[Inject]
		public var product:Product;
		
		[Inject]
		public var logger:Logger;
		
		[Inject]
		public var loadingFrameSignal:LoadingFrameSignal;
		
		override public function execute():void
		{
			logger.debug("Command >> LoadProductCommand called >> " + product.ProductName);
			if(product.ProductName=="Hotels")
			{
				//Now loading the Hotels
				hotelsService.frameIdentifier=LoadingFrame.FRAME_ALL_HOTELS;
				hotelsService.getDominoData("LoadAllHotels");
			}
				else
				{
					service.frameIdentifier=LoadingFrame.FRAME_ALL_TOURS;
					service.getDominoData("LoadAllTours");
				}
		}
	}
}