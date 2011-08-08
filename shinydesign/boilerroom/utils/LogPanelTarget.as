package shinydesign.boilerroom.utils
{
	import mx.collections.ArrayCollection;
	import mx.core.mx_internal;
	import mx.logging.ILogger;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.LineFormattedTarget;
	
	import shinydesign.boilerroom.model.vo.LogEntry;
	
	import spark.components.TextArea;
	import flash.utils.*;
	public class LogPanelTarget extends LineFormattedTarget
	{
			public var logData:ArrayCollection=new ArrayCollection();
		private var counter:Number=0;
		public function LogPanelTarget()
		{
			super();
		}
		
		override public function logEvent(event:LogEvent):void{
			var logEntry:LogEntry=new LogEntry();
			counter++;
			logEntry.index=counter;
			var level:int = event.level;
			if( event.level == LogEventLevel.ALL || 
				event.level == LogEventLevel.INFO )
				level = 0x02;
			else if( event.level == LogEventLevel.DEBUG )
				level = 0x01;
			else if( event.level == LogEventLevel.WARN )
				level = 0x04;
			else if( event.level == LogEventLevel.ERROR ||
				event.level == LogEventLevel.FATAL )
				level = 0x08;
			
			var category:String = includeCategory ? ILogger(event.target).category + fieldSeparator :				"";
			logEntry.level=level;
			logEntry.category=category;
			logEntry.message= event.message;
			logEntry.flashTime=flash.utils.getTimer();
			//logData.addItem(logEntry);		
		}
	
		
	}
	}