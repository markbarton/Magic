package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.BrowserService;
	import shinydesign.boilerroom.services.IBrowserService;
	
	public class StartupCommand extends SignalCommand
	{
		[Inject]
		public var service:IBrowserService
		
		override public function execute():void
		{
			service.CheckBrowserReady();
		}
	}
}