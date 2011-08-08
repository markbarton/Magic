package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.services.dominodata.SendContentService;
	import shinydesign.boilerroom.signals.SendItineraryToServerSignal;
	import shinydesign.boilerroom.utils.ProcessTemplates;
	
	public class SendItineraryToServerCommand extends SignalCommand
	{
		[Inject]
		public var sendContentService:SendContentService;
		
		[Inject]
		public var toursModel:ToursModel;
		//Call the process template class
		override public function execute():void
		{
			var process:ProcessTemplates=new ProcessTemplates();
			var workingContent:String=process.processStandard(toursModel.CurrentTour.Itinerary);
			trace("Command >> sendItinerary To Server");
			sendContentService.sendDominoData("SendContent",workingContent);
			
		}
	}
}