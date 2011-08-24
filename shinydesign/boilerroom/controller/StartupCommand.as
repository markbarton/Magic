package shinydesign.boilerroom.controller
{
		import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.TraceTarget;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	import shinydesign.boilerroom.services.BrowserService;
	import shinydesign.boilerroom.services.IBrowserService;
	import shinydesign.boilerroom.utils.LogPanelTarget;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.utils.XPanelDebugTarget;
	import shinydesign.boilerroom.views.admin.LogPanel;
	
	public class StartupCommand extends SignalCommand
	{
		[Inject]
		public var service:IBrowserService
		
		[Inject]
		public var log:Logger; //For all logging
		
		[Inject]
		public var logPanel:LogPanelTarget;
		
		override public function execute():void
		{
			
			//setup log targets
			var traceTarget:TraceTarget=new TraceTarget();
			traceTarget.level=LogEventLevel.DEBUG;
			traceTarget.includeCategory=true;
			traceTarget.includeDate=true;
			traceTarget.includeLevel=true;
			traceTarget.includeTime=true;
			traceTarget.filters = ["shinydesign.boilerroom.*"];
			Log.addTarget(traceTarget);
			var xPanelTarget:XPanelDebugTarget=new XPanelDebugTarget();
			xPanelTarget.level=LogEventLevel.DEBUG;
			xPanelTarget.includeCategory=true;
			xPanelTarget.includeDate=true;
			xPanelTarget.includeLevel=true;
			xPanelTarget.includeTime=true;
			xPanelTarget.filters = ["shinydesign.boilerroom.*"];
			Log.addTarget(xPanelTarget);
			logPanel.level=LogEventLevel.DEBUG;
			logPanel.includeCategory=true;
			logPanel.includeDate=true;
			logPanel.includeLevel=true;
			logPanel.includeTime=true;
			logPanel.filters = ["shinydesign.boilerroom.*"];
			
			log.debug("Command >> StartupCommand Called");
			
			
			//logger.logContent(Logger.DEBUG,"Startup Command");
			service.CheckBrowserReady();
		}
		
		
	}
}