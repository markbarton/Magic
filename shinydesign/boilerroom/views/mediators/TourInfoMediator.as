package shinydesign.boilerroom.views.mediators
{
	import images.ImageAsset;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.PostContent;
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.CurrentTourSetSignal;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.signals.SelectedProductSignal;
	import shinydesign.boilerroom.signals.SendContentResultSignal;
	import shinydesign.boilerroom.signals.SendItineraryToServerSignal;
	import shinydesign.boilerroom.signals.TourInfoLoadedSignal;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.utils.ProcessTemplates;
	import shinydesign.boilerroom.views.product.tours.TourInformation;

	public class TourInfoMediator extends Mediator
	{
		
		[Inject]
		public var view:TourInformation;
		
		[Inject]
		public var tourInfoLoadedSignal:TourInfoLoadedSignal;
		
		[Inject]
		public var toursModel:ToursModel;
		
		[Inject]
		public var currentTourSet:CurrentTourSetSignal;
		
		[Inject]
		public var selectedProductSignal:SelectedProductSignal; //Listen for when a product button has changed the selected product so we can hide the current data while waiting for new stuff
		
		[Inject]
		public var postContentToServerSignal:PostContentToServerSignal;
		
		[Inject]
		public var sendContentResultSignal:SendContentResultSignal;
		
		[Inject]
		public var log:Logger;
		
		public const TOUR_ITINERARY="TourItinerary";
		
		override public function onRegister():void
		{ 
			//Listen for the search signal to perform filter
			
			view.tmpSignal.add(sendItineraryToServer);
			//view.tourSelected.add(setSelectedTour);
			
			selectedProductSignal.add(clearView); //Clear when product is slected
			currentTourSet.add(clearViewTour);
			
			tourInfoLoadedSignal.add(updateView); //clear when a tour is initially selected
			if(toursModel.CurrentTour!=null)
				updateView(toursModel.CurrentTour);
			
			sendContentResultSignal.add(notifyResult);
			
		}
		
		override public function onRemove():void{
			view.tmpSignal.remove(sendItineraryToServer);
			selectedProductSignal.remove(clearView);
			currentTourSet.remove(clearViewTour);
			currentTourSet.remove(clearViewTour);
			tourInfoLoadedSignal.remove(updateView);
			sendContentResultSignal.remove(notifyResult);
			
		}
		
		
		private function clearView(product:Product):void
		{
			//Each signal that triggers this has different payloads which we are not interested in hence the ...
			if(view!=null){
			view.currentState="normal";
			if(view.currentTour!=null)
			view.currentTour=null;
			}
		}
		
		private function clearViewTour(tour:Tour):void{
			//Each signal that triggers this has different payloads which we are not interested in hence the ...
			if(view!=null){
				view.currentTour=tour;
				view.currentState="LoadingData";
			
			}
			
		}
		
		private function updateView(currentTour:Tour):void
		{
			view.currentState="DataLoaded";
				view.currentTour=currentTour;
		}
		
		private function sendItineraryToServer(content:String):void{
			var postContent:PostContent=new PostContent();
			//Parse the content
			var processTemplates:ProcessTemplates=new ProcessTemplates();
			processTemplates.log=log;
			postContent.content=processTemplates.processStandard(content);
			postContent.contentType=TOUR_ITINERARY;
			postContentToServerSignal.dispatch(postContent);
			
		}
		
		private function notifyResult(result:Boolean,originID:String):void
		{
			if(originID==TOUR_ITINERARY){
			//change the button to display result;
			if(result==true){
				Alert.show("Content sent to Server OK","Success",4,null,null,images.ImageAsset.SuccessIcon);
			}else{
				Alert.show("Content NOT sent to Server","Failure",4,null,null,images.ImageAsset.FailureIcon);
				}
			}
		}
	}
}