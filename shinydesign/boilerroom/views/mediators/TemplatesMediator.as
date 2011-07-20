package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.DragStartedSignal;
	import shinydesign.boilerroom.signals.SelectedTemplateSignal;
	import shinydesign.boilerroom.signals.TemplatesLoadedSignal;
	import shinydesign.boilerroom.views.contentparser.component.Templates;
	
	public class TemplatesMediator extends Mediator
	{
		[Inject]
		public var templatesLoaded:TemplatesLoadedSignal; //Signal to indicate templates loaded
		[Inject]
		public var selectedTemplateSignal:SelectedTemplateSignal; //signal to indicate which template has been selected
		[Inject]
		public var dragStartedSignal:DragStartedSignal; //signal to indicate we have started dragging
		//Model
		[Inject]
		public var templatesModel:TemplatesModel;
		
		[Inject]
		public var view:Templates; //The actual view
		
		override public function onRegister():void
		{ 
			//Listen for the view signal so we can redispatch - actual logic for handling is managed elsewhere
			view.tmpSignal.add(templateSelected);
			view.dragStartSignal.add(dragStarted);
			
			//Attach to the templatesloaded signal
			templatesLoaded.add(updateView);
			//If the model already has templates loaded update the view
			if(templatesModel.Templates.size()!=0){
				updateView(templatesModel);			
			}
		}
		
		private function dragStarted():void
		{
			// TODO Auto Generated method stub
			dragStartedSignal.dispatch();
			view.Description.text=view.templateGrid.selectedItem.Description;
		}
		
		private function templateSelected(template:Template):void
		{
			// TODO Auto Generated method stub\
			//Adding false to the signal to indicate its being removed from the selected templates
			selectedTemplateSignal.dispatch(template,false);
			
		}		
		private function updateView(templateModel:TemplatesModel):void{
			//If the templates loaded signal is picked up this method is called - its also called if the model already has templates when the view is loaded
			trace("View >> Using Templates Model");
			//Data Grid
			view.templateGrid.dataProvider=templateModel.AllTemplates;
		}
		
	}
}