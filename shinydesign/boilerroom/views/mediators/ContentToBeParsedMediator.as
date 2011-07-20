package shinydesign.boilerroom.views.mediators
{
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.signals.ContentToBeParsedChangedSignal;
	import shinydesign.boilerroom.views.contentparser.component.ContentToBeParsed;
	
	public class ContentToBeParsedMediator extends Mediator
	{
		[Inject]
		public var contentToBeParsedSignal:ContentToBeParsedChangedSignal; //signal
		[Inject]
		public var view:ContentToBeParsed;
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(ContentChanged);
			
		}
		
		private function ContentChanged(content:String):void
		{
			// TODO Auto Generated method stub
			contentToBeParsedSignal.dispatch(content);
			
		}		
	}
}