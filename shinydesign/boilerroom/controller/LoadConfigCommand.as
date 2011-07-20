package shinydesign.boilerroom.controller
{
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.IConfigService;
	
	public class LoadConfigCommand extends SignalCommand
	{
		
		[Inject]
		public var service:IConfigService;
		
		override public function execute():void
		{
			trace("Command >> LoadConfigCommand Called");
			service.loadConfig();
		}
	}
}