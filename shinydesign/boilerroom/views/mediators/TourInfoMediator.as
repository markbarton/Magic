package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.CurrentTourSetSignal;
	import shinydesign.boilerroom.signals.SelectedProductSignal;
	import shinydesign.boilerroom.signals.TourInfoLoadedSignal;
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
		
		//private var currentTour:Tour;
		
		override public function onRegister():void
		{ 
			//Listen for the search signal to perform filter
			//view.tmpSignal.add(doFilter);
			//view.tourSelected.add(setSelectedTour);
			
			selectedProductSignal.add(clearView); //Clear when product is slected
			currentTourSet.add(clearViewTour);
			
			tourInfoLoadedSignal.add(updateView); //clear when a tour is initially selected
			if(toursModel.CurrentTour!=null)
				updateView(toursModel.CurrentTour);
			
		}
		
		private function clearView(product:Product):void
		{
			//Each signal that triggers this has different payloads which we are not interested in hence the ...
			if(view!=null){
			view.currentState="Normal";
			if(view.currentTour!=null)
			view.currentTour=null;
			}
		}
		
		private function clearViewTour(tour:Tour):void{
			//Each signal that triggers this has different payloads which we are not interested in hence the ...
			if(view!=null){
				view.currentState="Normal";
				if(view.currentTour!=null)
					view.currentTour=null;
			}
			
		}
		
		private function updateView(currentTour:Tour):void
		{
			view.currentState="DataLoaded";
				view.currentTour=currentTour;
		}
		
	}
}