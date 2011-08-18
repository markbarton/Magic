package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.CheckAllocationService;
	import shinydesign.boilerroom.signals.CheckAllocationSignal;
	import shinydesign.boilerroom.utils.Logger;
	
	public class CheckAllocationCommand extends SignalCommand
	{
		[Inject]
		public var service:CheckAllocationService;
		[Inject]
		public var content:String; //From signal
		[Inject]
		public var logger:Logger;
		override public function execute():void
		{
		logger.debug("CheckAllocationCommand >>" + content);
		service.params.key=content;
			service.getDominoData("CheckAllocation");
		}
	}
}