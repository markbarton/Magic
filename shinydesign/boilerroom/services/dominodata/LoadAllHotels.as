package shinydesign.boilerroom.services.dominodata
{
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.HotelsModel;
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.signals.HotelsLoadedSignal;
	import shinydesign.boilerroom.signals.LoadingFrameSignal;
	import shinydesign.boilerroom.utils.Logger;

	public class LoadAllHotels extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var hotelsModel:HotelsModel;
		[Inject]
		public var hotelsLoadedSignal:HotelsLoadedSignal;
		
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			//Clear Collection first
			if(hotelsModel.Hotels!=null)
				hotelsModel.Hotels=new ArrayCollection();
			
			CursorManager.removeBusyCursor();
			logger.debug("LoadAllHotels >> Handle Results");
			
			for each(var obj:XML in event.result.hotel)
			{
				var hotel:Hotel=new Hotel();
				hotel.Country=obj.country;
				hotel.Region=obj.region;
				hotel.HotelName=obj.hotelname;
				hotel.StarRating=obj.starrating;
				hotel.SupplierCode=obj.suppliercode;
				hotel.UNID=obj.unid;
				
				//Add to array collection
				hotelsModel.Hotels.addItem(hotel);
			}
			
			//Dispatch Signal indicating we have updated the products model	
			hotelsLoadedSignal.dispatch(hotelsModel);
			
			super.handleServiceResult(event,endPointKey);
		}
	}
}