package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.dominodata.user.CurrentUserService;
	
	public class LoadCurrentUserCommand extends SignalCommand
	{
		[Inject]
		public var service:CurrentUserService;
		
		override public function execute():void
		{
			trace("Command >> LoadCurrentUser Called");
			service.getDominoData("CurrentUser");
		}
	}
}