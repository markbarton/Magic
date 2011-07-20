package shinydesign.boilerroom.services.dominodata
{
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.ProductDataLoadedSignal;
	import shinydesign.boilerroom.signals.ToursLoaded;

	public class LoadAllToursService extends DominoXMLService implements IDominoXMLService
	{
		
		[Inject]
		public var toursModel:ToursModel;
		[Inject]
		public var toursLoaded:ToursLoaded;
		[Inject]
		public var productDataLoaded:ProductDataLoadedSignal; //Generic Product Loade Signal for container to display
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			//Clear Collection first
			if(toursModel.Tours!=null)
				toursModel.Tours=new ArrayCollection();
			
			CursorManager.removeBusyCursor();
			trace("Service >> LoadAllTours");
			
			for each(var obj:XML in event.result.tour)
			{
				var tour:Tour=new Tour();
				tour.Continent=obj.continent;
				tour.Country=obj.country;
				tour.Title=obj.title;
				tour.UNID=obj.unid;
				tour.StartPoint=obj.startpoint;
				
				//Add to array collection
				toursModel.Tours.addItem(tour);
			}
			//Dispatch Gerneic Data Loaded Signal
			productDataLoaded.dispatch();
			
			//Dispatch Signal indicating we have updated the products model	
			toursLoaded.dispatch(toursModel);
		}
	}
}