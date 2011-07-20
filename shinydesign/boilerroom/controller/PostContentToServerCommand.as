package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.SendContentService;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	
	public class PostContentToServerCommand extends SignalCommand
	{
		[Inject]
		public var content:String; //injected content from signal
		
		[Inject]
		public var sendContentService:SendContentService;
		
		//Call the process template class
		override public function execute():void
		{
			trace("Command >> PostContentCommand");
			sendContentService.sendDominoData("SendContent",content);
			
		}
	}
}