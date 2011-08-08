package shinydesign.boilerroom.views.mediators
{
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.utils.LogPanelTarget;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.views.admin.LogPanel;
	
	import spark.components.Button;
	
	public class LogPanelMediator extends Mediator
	{
		[Inject]
		public var logPanelTarget:LogPanelTarget;
		[Inject]
		public var view:LogPanel;
		[Inject]
		public var appConfigModel:ApplicationConfigModel;
		[Inject]
		public var log:Logger;
		
		private var filterLevel:Number = 0;
		private var filterWord:String = "";
		private var hasFilterWord:Boolean = false;
		public const ALL_LEVEL:int = 15;
		private var toggleButtonArray:Array;
		
		
	
		override public function onRegister():void
		{ 
			view.appConfigModel=appConfigModel;
		//	toggleButtonArray = [view.allButton, view.debugButton, view.infoButton, view.warnButton, view.errorButton];
			//view.logData=logPanelTarget.logData;
			//view.logData.filterFunction = filterLogEntries;
			//view.tmpSignal.add(wordFilterChange);
			//view.buttonSignal.add(buttonListener);you 
			//setFilterLevel(ALL_LEVEL);
			
		}
		
		
		private function buttonListener(button:Button):void
		{
			if(button.id=="allButton")
				setFilterLevel(15);
			if(button.id=="debugButton")
				setFilterLevel(1);
			if(button.id=="infoButton")
				setFilterLevel(2);
			if(button.id=="warnButton")
				setFilterLevel(4);
			if(button.id=="errorButton")
				setFilterLevel(8);
			
		}
		
		private function filterLogEntries(item:Object):Boolean 
		{
			if ((item.level & filterLevel) == item.level)   // using bitwise AND operator to check if log message complies with current filterLevel
			{
				if(hasFilterWord)
				{
					if((item.message as String).indexOf(filterWord) != -1) return true;
					else return false;
				}
				else return true;
			} 
			else 
			{
				return false;
			}
		}
		
	
		
		protected function setFilterLevel(value:int):void
		{
			filterLevel = value;
			
		view.logData.refresh();
		}
		
		
		private function wordFilterChange():void
		{
			//filterWord = view.wordFilter.text;
			if(filterWord.length > 0) hasFilterWord = true;
			else hasFilterWord = false;
			
			
			view.logData.refresh();
		}
		
	}
}