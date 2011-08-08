package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.signals.ApplicationStateChangeSignal;
	import shinydesign.boilerroom.signals.DragStartedSignal;
	
	public class BoilerRoomMediator extends Mediator
	{
		[Inject]
		public var view:BoilerRoom;
		[Inject]
		public var applicationStateChangeSignal:ApplicationStateChangeSignal;
		override public function onRegister():void
		{ 
			applicationStateChangeSignal.add(updateView);
			
		}
		
		private function updateView(stateName:String):void
		{
			// TODO Auto Generated method stub
			trace("Main Application has picked up a state name change >> "+stateName);
			if(stateName=="productInformationButton")
				view.currentState="ProductInformation";
			if(stateName=="contentParserButton")
				view.currentState="ContentParser"
			if(stateName=="adminButton")
				view.currentState="Admin"
		}		
		
	}
}