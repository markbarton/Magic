package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.ProductInfoLoadedSignal;
	import shinydesign.boilerroom.signals.TourInfoLoadedSignal;

	public class LoadTourInformationService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var toursModel:ToursModel;
	
		[Inject]
		public var tourInfoLoadedSignal:TourInfoLoadedSignal;
		
		[Inject]
		public var productInfoLoadedSignal:ProductInfoLoadedSignal; //Generic ProductInfo Signal
		
		private var currentTour:Tour;
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			
			CursorManager.removeBusyCursor();
			trace("Service >> LoadTour");
			currentTour=toursModel.CurrentTour;
			for each(var obj:XML in event.result)
			{
				currentTour.Thumbnail=obj.thumbnail;
				currentTour.MainImage=obj.mainimage;
				currentTour.Intro=obj.intro;
				currentTour.TourStyle=obj.tourstyle;
				currentTour.Itinerary=obj.itinerary;
				currentTour.Inclusions=obj.inclusions;
				currentTour.Extras=obj.extras;
				currentTour.StartPoint=obj.startpoint;
				currentTour.Duration=obj.duration;
				var tmpArray:Array=obj.highlights.split("\n");
				var tmpOut:String="";
				for(var i:Number=0;i<tmpArray.length;i++){
				if(tmpOut=="")
					tmpOut+="*"+tmpArray[i];	
				else
					tmpOut+=" *"+tmpArray[i];	
					
				}
				
				currentTour.Highlights=replaceString(tmpOut,"\r","");
				currentTour.AUD=obj.aud;
				currentTour.EUR=obj.eur;
				currentTour.GBP=obj.gbp;
			}
			
			//Dspatch Generic Signal
			productInfoLoadedSignal.dispatch();
			//Dispatch Signal indicating we have updated the products model	
			tourInfoLoadedSignal.dispatch(currentTour);
			
		}
	
		public function replaceString(str:String, find:String, replace:String):String {
			var startIndex:Number = 0;
			var oldIndex:Number = 0;
			var newString:String = "";
			
			while ((startIndex = str.indexOf(find, startIndex)) != -1) {
				newString += str.substring(oldIndex, startIndex) + replace;
				oldIndex = startIndex += find.length;
			}
			
			return((newString == "") ? str : newString);
		}
	}
	
	
}