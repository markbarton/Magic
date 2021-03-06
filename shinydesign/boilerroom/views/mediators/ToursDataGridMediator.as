package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ToursModel;
		import shinydesign.boilerroom.model.vo.Tour;
		import shinydesign.boilerroom.signals.ToursLoadedSignal;
	import shinydesign.boilerroom.views.product.tours.ToursDataGrid;
	
	public class ToursDataGridMediator extends Mediator
	{
		[Inject]
		public var view:ToursDataGrid;
		
		[Inject]
		public var toursLoadedSignal:ToursLoadedSignal;
		
		[Inject]
		public var toursModel:ToursModel;
		
		private var searchText:String;
		
		override public function onRegister():void
		{ 
			//Listen for the search signal to perform filter
			view.tmpSignal.add(doFilter);
			view.tourSelected.add(setSelectedTour);
			
			//Attach to the toursloaded signal
			toursLoadedSignal.add(updateView);
			
			//If the model already has tours loaded update the view
			if(toursModel.Tours.length!=0)
				updateView(toursModel);
		}
		
		
		private function updateView(toursModel:ToursModel):void
		{	
				view.tours.dataProvider=toursModel.Tours;	
		}
		
		private function setSelectedTour(selectedTour:Tour):void{
			//setting the current tour on the model should be enough as the model will dispatch its own signal
			toursModel.CurrentTour=selectedTour;
		}
		
		private function doFilter(searchText:String):void{ 
			//Set the filter function on data provider
			this.searchText=searchText;
			toursModel.Tours.filterFunction=processFilter;
			toursModel.Tours.refresh();
		}
		
		//Filter function
		private function processFilter(item:Object):Boolean {
			var matched:Boolean=false;
			var fieldNames:Array=["Continent","Country","Title","TourStyle","Duration"];
			//Needs to be a visible item rather than any other additional values which are in the VO
			for each(var id:String in fieldNames) {
				var value:Object = item[id];
				if(value!=null){
					if(value.match(new RegExp("^"+ view.search.text + ".","i")))
						matched=true;
					if(value.toString().toLowerCase()==view.search.text.toLowerCase())
						matched=true;		
				}
			}
			
			
			return matched;
		}
	}
}