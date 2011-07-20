package shinydesign.boilerroom.model.vo
{
	public class BrowserVariables
	{
		//This class will hold variables been passed to the application via the loading page
		
		private var _Query:String; //possible searh query
		//location of the configuration file - allows a different config file to be passed to different instances of this application
		//Setting a default so we do not need to pass every time
		private var _ConfigLocation:String="flex.config.xml"; 
		
		public function BrowserVariables()
		{
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