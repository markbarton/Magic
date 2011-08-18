package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.services.dominodata.LoadHotelService;
	
	public class LoadHotelInfoCommand extends SignalCommand
	{
		[Inject]
		public var currentHotel:Hotel;
		[Inject]
		public var service:LoadHotelService;
		
		override public function execute():void
		{
			trace("Command >> Load Tour Information Command Called");
			service.params.key=currentHotel.UNID;
			service.frameIdentifier=LoadingFrame.FRAME_HOTEL_INFO
			service.getDominoData("LoadHotel");
		}
	}
}