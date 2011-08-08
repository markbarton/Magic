package shinydesign.boilerroom.utils
{
	import mx.logging.ILogger;
	import mx.logging.ILoggingTarget;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	public class Logger
	{
		//~ Instance Attributes -----------------------------------------------
		public var logger : ILogger;
		//~ Constructor -------------------------------------------------------
		/**
		 * SingletonEnforcer parameter ensures that only the getInstance
		 * method can create an instance of this class.
		 */
		public function Logger(category : String) : void
		{
			this.logger = Log.getLogger(category);
		}
		
	
		
		public static function addTarget(target : ILoggingTarget) : void
		{
			Log.addTarget(target);
		}
		
		public function debug(message : String) : void
		{
			this.logger.debug(message);
		}
		
		public function info(message : String) : void
		{
			this.logger.info(message);
		}
		public function warn(message : String) : void
		{
			this.logger.warn(message);
		}
		public function error(message : String) : void
		{
			this.logger.error(message);
				}
		// other logging methods by level (e.g. warn, error)

}
	
}