package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.signals.SendContentResultSignal;
	import shinydesign.boilerroom.views.contentparser.component.ParsedContent;
	import mx.controls.Alert;
	import images.ImageAsset;
	
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
		
		private function notifyResult(result:Boolean):void
		{
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
		
		private function dispatchContentSignal(content:String):void
		{
			postContentToServerSignal.dispatch(content);
		}
		
		protected function contentUpdated(content:String):void{
			view.copyButton.label="Send to Server";
			view.ParsedContentContainer.text=content;
			view.copyButton.visible=true;
			view.colorEffect.play();
		}
	}
}