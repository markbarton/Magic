package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.services.dominodata.LoadTourInformationService;
	import shinydesign.boilerroom.signals.CurrentTourSetSignal;
	
	public class LoadTourInfoCommand extends SignalCommand
	{
		[Inject]
		public var currentTour:Tour;
		[Inject]
		public var service:LoadTourInformationService;
		
		override public function execute():void
		{
			trace("Command >> Load Tour Information Command Called");
			service.params.key=currentTour.UNID;
			service.frameIdentifier=LoadingFrame.FRAME_TOUR_INFO;
			service.getDominoData("LoadTour");
		}
	
	}
}