package shinydesign.boilerroom.views.mediators
{
	import images.ImageAsset;
	
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.vo.Allocation;
	import shinydesign.boilerroom.model.vo.PostContent;
	import shinydesign.boilerroom.signals.AllocationReturnSignal;
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
		[Inject]
		public var allocationReturnSignal:AllocationReturnSignal;
		
		public const PARSED_CONTENT:String="ParsedContent";
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(dispatchContentSignal);
			
			contentProcessed.add(contentUpdated);
			sendContentResultSignal.add(notifyResult);
			allocationReturnSignal.add(warnAllocation);
		}
		
		private function warnAllocation(allocation:Allocation):void
		{
			log.debug(ObjectUtil.toString(allocation));
			// TODO Auto Generated method stub
			if(allocation.hasAllocation!=false){
				if(allocation.hasMulti){
				//Multiple matches to the allocation - this wouild be due to no template
					Alert.show("Multiple Allocations have been found for " + allocation.matchingKey + ".\n\nThe cruise lines matching are: " + allocation.cruiseLines,"Multiple Allocations",4);
					view.warningText="Multiple Allocation Warning";
					view.warningColor=returnAllocationColor(allocation.allocationType);
				}else{
				view.warningText="Allocation Warning (" + allocation.allocationType + ")";
				view.warningColor=returnAllocationColor(allocation.allocationType);
				}
				
			//view.AllocationWarning.text="Allocation Warning (" + warning + ")";
			//view.AllocationWarning.setStyle("color",returnAllocationColor(warning));
			}
			else{
			view.warningText="";
			view.warningColor=0xD9D9D9;
			}
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
		private function returnAllocationColor(warning:String):uint{
			var returnVal:uint;
			
			if(warning=="Allocation")
				returnVal=0xff0000;
			if(warning=="Irish Allocation")
				returnVal=0x007658;
			if(warning=="Warning")
				returnVal=0xff00e4;
			if(warning=="Advertised Allocation")
				returnVal=0x000fff;
			if(warning=="Magazine Allocation")
				returnVal=0xf20fff;
				
			return returnVal;
			
		}
	}
}