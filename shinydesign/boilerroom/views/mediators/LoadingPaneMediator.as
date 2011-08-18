package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.signals.LoadingFrameSignal;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.views.components.container.LoadingPane;
	
	public class LoadingPaneMediator extends Mediator
	{
		[Inject]
		public var view:LoadingPane;
		
		[Inject]
		public var loadingFrameSignal:LoadingFrameSignal;
		
		[Inject]
		public var logger:Logger;
		
		override public function onRegister():void
		{ 
			//Attach to the loadingFrameSignal
			loadingFrameSignal.add(updateView);
		}
		
		override public function onRemove():void{
			loadingFrameSignal.remove(updateView);	
		}
		
		private function updateView(loadingFrame:LoadingFrame):void
		{	
			//If loading hotels then reset product frames
			if(loadingFrame.frameIdentifier==LoadingFrame.FRAME_ALL_HOTELS){
				if(view.frameIdentifier==LoadingFrame.FRAME_TOUR_INFO||view.frameIdentifier==LoadingFrame.FRAME_ALL_TOURS)
					view.setNormal();
			}
			
			//If loading tours then reset product frames
			if(loadingFrame.frameIdentifier==LoadingFrame.FRAME_ALL_TOURS){
				if(view.frameIdentifier==LoadingFrame.FRAME_HOTEL_INFO||view.frameIdentifier==LoadingFrame.FRAME_ALL_HOTELS)
					view.setNormal();
			}
			
			
			logger.debug("LoadingPaneMediator (" + view.frameIdentifier + ") >> Got Signal for: " + loadingFrame.frameIdentifier + " with state: " + loadingFrame.state);
			//If the signal identifier matches this frame then set the state
			if(loadingFrame.frameIdentifier==view.frameIdentifier){
				if(loadingFrame.state==loadingFrame.NORMAL_STATE){
					view.setNormal();
				logger.debug("Setting Normal on: " + loadingFrame.frameIdentifier);	
				}
				if(loadingFrame.state==loadingFrame.LOADING_STATE)
					view.loading=true;
				if(loadingFrame.state==loadingFrame.DATA_LOADED)
					view.dataLoaded=true;			
			}
			
		}
		
	}
}