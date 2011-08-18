package shinydesign.boilerroom.views.mediators
{
	import images.ImageAsset;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.HotelsModel;
	import shinydesign.boilerroom.model.vo.Hotel;
	import shinydesign.boilerroom.model.vo.PostContent;
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.CurrentHotelSetSignal;
	import shinydesign.boilerroom.signals.HotelInfoLoadedSignal;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.signals.SendContentResultSignal;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.utils.ProcessTemplates;
	import shinydesign.boilerroom.views.product.hotels.HotelInformation;
	
	public class HotelInfoMediator extends Mediator
	{
		
		[Inject]
		public var view:HotelInformation;
		
		[Inject]
		public var hotelInfoLoadedSignal:HotelInfoLoadedSignal;
		
		[Inject]
		public var hotelsModel:HotelsModel;
		
		[Inject]
		public var currentHotelSet:CurrentHotelSetSignal;
			
		[Inject]
		public var postContentToServerSignal:PostContentToServerSignal;
		
		[Inject]
		public var sendContentResultSignal:SendContentResultSignal;
		
		[Inject]
		public var log:Logger;
		
		public const HOTEL_DESCRIPTION:String="HotelDescription";
		
		override public function onRegister():void
		{ 
			//Listen for the search signal to perform filter
			
			view.tmpSignal.add(sendItineraryToServer);
			//view.tourSelected.add(setSelectedTour);
			
			//	currentTourSet.add(clearViewTour);
			
			hotelInfoLoadedSignal.add(updateView); //clear when a hotel is initially selected
			if(hotelsModel.CurrentHotel!=null)
				updateView(hotelsModel.CurrentHotel);
			
			sendContentResultSignal.add(notifyResult);
			
		}
		
		override public function onRemove():void{
			view.tmpSignal.remove(sendItineraryToServer);
			currentHotelSet.remove(clearViewTour);
			hotelInfoLoadedSignal.remove(updateView);
			sendContentResultSignal.remove(notifyResult);
			
		}
		
		
		private function clearViewTour(hotel:Hotel):void{
			//Each signal that triggers this has different payloads which we are not interested in hence the ...
			if(view!=null){
				view.currentHotel=hotel;		
			}
			
		}
		
		private function updateView(currentHotel:Hotel):void
		{
				view.currentHotel=currentHotel;
		}
		
		private function sendItineraryToServer(content:String):void{
			var postContent:PostContent=new PostContent();
			//Parse the content
			var processTemplates:ProcessTemplates=new ProcessTemplates();
			processTemplates.log=log;
			postContent.content=processTemplates.processStandard(content);
			postContent.contentType=HOTEL_DESCRIPTION;
			postContentToServerSignal.dispatch(postContent);
			
		}
		
		private function notifyResult(result:Boolean,originID:String):void
		{
			if(originID==HOTEL_DESCRIPTION){
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