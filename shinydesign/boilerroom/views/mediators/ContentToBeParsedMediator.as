package shinydesign.boilerroom.views.mediators
{
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.model.vo.BrowserVariables;
	import shinydesign.boilerroom.signals.BrowserNameSetSignal;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.signals.ContentToBeParsedChangedSignal;
	import shinydesign.boilerroom.views.contentparser.component.ContentToBeParsed;
	
	public class ContentToBeParsedMediator extends Mediator
	{
		[Inject]
		public var contentToBeParsedSignal:ContentToBeParsedChangedSignal; //signal
		[Inject]
		public var view:ContentToBeParsed;
		[Inject]
		public var appModel:ApplicationConfigModel;
		[Inject]
		public var browserNameSetSignal:BrowserNameSetSignal;
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(ContentChanged);
			trace("Checking for Browser Name >> " + appModel.browserVariables.BrowserName);
			if(appModel.browserVariables.BrowserName!="Microsoft Internet Explorer"){
				view.pasteContentButton.visible=false;
			}
		browserNameSetSignal.add(setPasteButton);
		}
		
		private function setPasteButton(browserName:String):void
		{
			trace("Browser Name Set Signal>> " + browserName);
			// TODO Auto Generated method stub
			if(browserName!="Microsoft Internet Explorer"){
				view.pasteContentButton.visible=false;
			}
		}		
		
		
		
		private function ContentChanged(content:String):void
		{
			// TODO Auto Generated method stub
			contentToBeParsedSignal.dispatch(content);
			
		}		
	}
}