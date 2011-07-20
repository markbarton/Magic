package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.signals.ApplicationStateChangeSignal;
	import shinydesign.boilerroom.views.topbanner.TopBannerControls;
	
	public class TopBannerMediator extends Mediator
	{
		[Inject]
		public var view:TopBannerControls;
		
		[Inject]
		public var applicationStateChange:ApplicationStateChangeSignal;
		
		override public function onRegister():void
		{ 
			view.tmpSignal.add(dispatchStateChange);
			//Set Deafult Button
			view.setActiveButton('contentParserButton');
		}
		
		private function dispatchStateChange(stateName:String):void
		{
			applicationStateChange.dispatch(stateName);
		}
	}
}