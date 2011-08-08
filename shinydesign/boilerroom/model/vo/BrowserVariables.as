package shinydesign.boilerroom.model.vo
{
	import shinydesign.boilerroom.signals.BrowserNameSetSignal;

	[Bindable]
	public class BrowserVariables
	{
		//This class will hold variables been passed to the application via the loading page
		
		private var _Query:String; //possible searh query
		//location of the configuration file - allows a different config file to be passed to different instances of this application
		//Setting a default so we do not need to pass every time
		private var _ConfigLocation:String="flex.config.xml"; 
		private var _BrowserName:String="";
		[Inject]
		public var browserNameSetSignal:BrowserNameSetSignal;
		
		public function BrowserVariables()
		{
			
		}
		
		[PostConstruct]
		public function init():void
		{
			// all dependencies have now been satisfied
			trace("Dispatching BrowserName Set Signal >> " + _BrowserName);
			browserNameSetSignal.dispatch(_BrowserName);
		}

		public function get BrowserName():String
		{
			return _BrowserName;
		}

		public function set BrowserName(value:String):void
		{
			_BrowserName = value;
			trace("Browser Name = " + value);
		}

		public function get ConfigLocation():String
		{
			return _ConfigLocation;
		}

		public function set ConfigLocation(value:String):void
		{
			_ConfigLocation = value;
			trace("Configuration Location set = " + value);
		}

		public function get Query():String
		{
			return _Query;
		}

		public function set Query(value:String):void
		{
			_Query = value;
			trace("Query set from Query String = " + value);
			
		}

	}
}