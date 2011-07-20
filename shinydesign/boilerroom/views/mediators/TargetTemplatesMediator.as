package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.DragStartedSignal;
	import shinydesign.boilerroom.signals.SelectedTemplateSignal;
	import shinydesign.boilerroom.views.contentparser.component.TemplatesTarget;
	
	public class TargetTemplatesMediator extends Mediator
	{
		[Inject]
		public var selectedTemplateSignal:SelectedTemplateSignal; //signal
		[Inject]
		public var view:TemplatesTarget;
		[Inject]
		public var dragStarted:DragStartedSignal;
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(templateSelected);
			dragStarted.add(animateBackground);
			
		}
		
		private function animateBackground():void
		{
			// TODO Auto Generated method stub
			view.colorEffect.play();
		}
		
		private function templateSelected(template:Template):void
		{
			// TODO Auto Generated method stub
			//Adding true to the signal to indicate the template is being added
			selectedTemplateSignal.dispatch(template,true);
			
		}		
	}
}