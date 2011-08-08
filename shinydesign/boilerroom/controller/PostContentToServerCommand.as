package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.model.vo.PostContent;
	import shinydesign.boilerroom.services.dominodata.SendContentService;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.utils.Logger;
	
	public class PostContentToServerCommand extends SignalCommand
	{
		[Inject]
		public var postContent:PostContent; //injected content from signal
		
		[Inject]
		public var sendContentService:SendContentService;
		
		[Inject]
		public var log:Logger; //For all logging
		
		//Call the process template class
		override public function execute():void
		{
			log.debug("Command >> PostContentCommand " + postContent.contentType + " content = " +  postContent.content);
			sendContentService.OriginID=postContent.contentType;
			sendContentService.sendDominoData("SendContent",postContent.content);
			
		}
	}
}