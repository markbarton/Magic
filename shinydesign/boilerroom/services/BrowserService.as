package shinydesign.boilerroom.services
{
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Actor;
	
	import shinydesign.boilerroom.*;
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.model.vo.ApplicationConfig;
	import shinydesign.boilerroom.model.vo.BrowserVariables;
	import shinydesign.boilerroom.signals.BrowserIsReadySignal;
	import shinydesign.boilerroom.utils.Logger;
	
	public class BrowserService extends Actor implements IBrowserService
	{
		[Inject]
		public var appModel:ApplicationConfigModel;
		
		[Inject]
		public var browserIsReady:BrowserIsReadySignal;
		
		[Inject]
		public var log:Logger; //For all logging
		
		public function BrowserService()
		{
			
		}
	
		
		public function CheckBrowserReady():void{
			log.debug("Service >> BrowserService Called");
			if (ExternalInterface.available)
			{
				try
				{
					// This calls the isContainerReady() method, which in turn calls
					// the container to see if it
					// is ready to receive calls from the SWF.
					var containerReady:Boolean = isContainerReady();
					if (containerReady)
					{
						readOptions();
						
					}
					else
					{
						// If the container is not ready, set up a Timer to call the
						// container at 100ms intervals. Once the container responds that
						// it's ready, the timer will be stopped.
						log.debug("BrowserService >> Browser not ready starting timer");
						var readyTimer:Timer = new Timer(100);
						readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
						readyTimer.start();
					}
				}
				catch (error:SecurityError)
				{
					log.error("A SecurityError occurred: " + error.message + "\n");
					throw error;
				}
				catch (error:Error)
				{
					log.error("An Error occurred: " + error.message + "\n");
					throw error;
				}
			}
			else
			{
				log.warn("External interface is not available for this container.");
			}
		}
		
		
		// ------- Private Methods -------
		
		/**
		 *This method exposes the various Actionscript methods that the host web page can call 
		 *If you need an Actionscript method to be availble then it needs to be added here 
		 */	
		
		private function setupCallbacks():void{
			
			
		}
		
		//This is where this service is reading from an external Javascript function
		//In this case we are looping through an object array so we can hold serveral properties
		//In this case we want the Query String if there is one.
		
		public function readOptions():void{
			var config:BrowserVariables=appModel.browserVariables;
			var listOptions:Object=new Object;
			listOptions=(ExternalInterface.call("listOptions"));
		
			if(listOptions.hasOwnProperty("query")){
				if(listOptions.query!=""){
					//Update Query Value on the Browser Variables Object on the Application Config Model
					//Get config from Model
						log.debug("BrowserService >> Got Query from Javascript >> "+ listOptions.query);
						config.Query=listOptions.query;
					//Dispatch Event
						
					//dispatch(new ApplicationEvent(ApplicationEvent.QUERY_STRING_SET,null,config));
				}
			}
			
			if(listOptions.hasOwnProperty("configLocation")){
				if(listOptions.configLocation!=""){
					//Update Config Location Value on the Browser Variables Object on the Application Config Model
					//Get config from Model
					log.debug("BrowserService >> Got Config Location from Javascript >> "+ listOptions.configLocation);
					config.ConfigLocation=listOptions.configLocation;
				}
			}
			if(listOptions.hasOwnProperty("BROWSER_NAME")){
				if(listOptions.BROWSER_NAME!=""){
					//Update Config Location Value on the Browser Variables Object on the Application Config Model
					//Get config from Model
					log.debug("BrowserService >> Browsername = " + listOptions.BROWSER_NAME);
					config.BrowserName=listOptions.BROWSER_NAME;
				}
			}
			//dispatch signal
			browserIsReady.dispatch();
		}
		
		/**
		 * Calls the container's isReady() function, to check if the container is loaded
		 * and ready to communicate with the SWF file.
		 * @return 	Whether the container is ready to communicate with ActionScript.
		 */
		private function isContainerReady():Boolean
		{
			var result:Boolean = ExternalInterface.call("isReady");
			return result;
		}
		
		/**
		 * Handles the timer event; this function is called by the timer each
		 * time the elapsed time has been reached.
		 * The net effect is that on regular intervals this function checks
		 * to see if the container is ready to receive communication.
		 * @param event		The event object for the Timer event.
		 */
		private function timerHandler(event:TimerEvent):void
		{
			// check if the container is now ready
			var isReady:Boolean = isContainerReady();
			if (isReady)
			{
				// If the container has become ready, we don't need to check anymore,
				// so stop the timer.
				Timer(event.target).stop();
				// Set up the ActionScript methods that will be available to be
				// called by the container.
				setupCallbacks();
			}
		}
	}
}