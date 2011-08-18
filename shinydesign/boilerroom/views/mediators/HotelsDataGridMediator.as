package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.HotelsModel;
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.signals.HotelsLoadedSignal;
	import shinydesign.boilerroom.views.product.hotels.HotelsDataGrid;
	
	public class HotelsDataGridMediator extends Mediator
	{
		
		[Inject]
		public var view:HotelsDataGrid;
		
		[Inject]
		public var hotelsLoadedSignal:HotelsLoadedSignal;
		
		[Inject]
		public var hotelsModel:HotelsModel;
		
		private var searchText:String;
		
		override public function onRegister():void
		{ 
			//Listen for the search signal to perform filter
			view.tmpSignal.add(doFilter);
			view.hotelSelected.add(setSelectedHotel);
			
			//Attach to the toursloaded signal
			hotelsLoadedSignal.add(updateView);
			
			//If the model already has tours loaded update the view
			if(hotelsModel.Hotels.length!=0)
				updateView(hotelsModel);
		}
		
		
		private function updateView(hotelsModel:HotelsModel):void
		{	
		//Dispatch Hotels Loaded Signal so Loading Component will change from loading to loaded	
			view.hotels.dataProvider=hotelsModel.Hotels;	
			
		}
		private function setSelectedHotel(selectedHotel:Hotel):void{
			//setting the current tour on the model should be enough as the model will dispatch its own signal
			hotelsModel.CurrentHotel=selectedHotel;
			
		}
		private function doFilter(searchText:String):void{ 
			//Set the filter function on data provider
			this.searchText=searchText;
			hotelsModel.Hotels.filterFunction=processFilter;
			hotelsModel.Hotels.refresh();
		}
		
		//Filter function
		private function processFilter(item:Object):Boolean {
			var matched:Boolean=false;
			var fieldNames:Array=["Country","Town","HotelName","StarRating","SupplierCode"];
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