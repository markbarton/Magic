package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.HotelsModel;
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.HotelInfoLoadedSignal;
	import shinydesign.boilerroom.signals.ProductInfoLoadedSignal;
	import shinydesign.boilerroom.signals.TourInfoLoadedSignal;

	public class LoadHotelService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var hotelsModel:HotelsModel;
	
		[Inject]
		public var hotelInfoLoadedSignal:HotelInfoLoadedSignal;
		
		
		private var currentHotel:Hotel;
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			
			CursorManager.removeBusyCursor();
			trace("Service >> LoadTour");
			currentHotel=hotelsModel.CurrentHotel;
			for each(var obj:XML in event.result)
			{
				currentHotel.Thumbnail=obj.thumbnail;
				currentHotel.Website=obj.website;
				currentHotel.Board=obj.board;
				var tmpArray:Array=obj.highlights.split("\n");
				var tmpOut:String="";
				for(var i:Number=0;i<tmpArray.length;i++){
					if(tmpOut=="")
						tmpOut+=tmpArray[i];	
					else
						tmpOut+=" *"+tmpArray[i];	
					
				}
				currentHotel.Highlights=replaceString(tmpOut,"\r","");
				
				tmpArray=obj.description.split("\n");
				tmpOut="";
				for(i=0;i<tmpArray.length;i++){
					if(tmpOut=="")
						tmpOut+=tmpArray[i];	
					else
						tmpOut+=" *"+tmpArray[i];	
					
				}
				currentHotel.Description=replaceString(tmpOut,"\r","");
					
			}
			logger.debug(currentHotel.Thumbnail);
			hotelInfoLoadedSignal.dispatch(currentHotel);
			super.handleServiceResult(event,endPointKey);
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