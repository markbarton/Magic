package shinydesign.boilerroom.views.mediators
{
	import images.ImageAsset;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.vo.PostContent;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.signals.SendContentResultSignal;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.views.contentparser.component.ParsedContent;
	
	public class ParsedContentMediator extends Mediator
	{
		[Inject]
		public var contentProcessed:ContentProcessedSignal;
		[Inject]
		public var view:ParsedContent;
		[Inject]
		public var postContentToServerSignal:PostContentToServerSignal;
		[Inject]
		public var sendContentResultSignal:SendContentResultSignal;
		[Inject]
		public var log:Logger; //For all logging
		
		public const PARSED_CONTENT="ParsedContent";
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(dispatchContentSignal);
			
			contentProcessed.add(contentUpdated);
			sendContentResultSignal.add(notifyResult);
		}
		
		override public function onRemove():void{
			contentProcessed.remove(contentUpdated);
			sendContentResultSignal.remove(notifyResult);
			view.tmpSignal.remove(dispatchContentSignal);
			
		}
		
		private function notifyResult(result:Boolean,originID:String):void
		{
			trace("ParsedContentMediator >> notifyResult >> " +originID); 
			if(originID==PARSED_CONTENT){
			//change the button to display result;
			if(result==true){
				Alert.show("Content sent to Server OK","Success",4,null,null,images.ImageAsset.SuccessIcon);
			view.copyButton.label="Content Sent To Server..";
			view.colorEffect.play();
			}else{
				Alert.show("Content NOT sent to Server","Failure",4,null,null,images.ImageAsset.FailureIcon);
				view.copyButton.label="Problem Sending Content..";				
			}
			}
		}
		
		private function dispatchContentSignal(content:String):void
		{
			log.debug("ParsedContentMediator >> " + content);
			var postContent:PostContent=new PostContent();
			postContent.contentType=PARSED_CONTENT;
			postContent.content=content;
			postContentToServerSignal.dispatch(postContent);
		}
		
		protected function contentUpdated(content:String):void{
			view.copyButton.label="Send to Server";
			view.ParsedContentContainer.text=content;
			view.copyButton.visible=true;
			view.colorEffect.play();
		}
	}
}