package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.signals.SelectedProductSignal;
	import shinydesign.boilerroom.views.product.ProductContainer;

	public class ProductContainerMediator extends Mediator
	{
		[Inject]
		public var view:ProductContainer; //View
		
		[Inject]
		public var selectedProductSignal:SelectedProductSignal; //Listen for when a product button has changed the selected product so we can hide the current data while waiting for new stuff
		
		
		
		override public function onRegister():void
		{ 
			selectedProductSignal.add(updateView);
			
			//productInfoLoadedSignal.add(updateView('DataLoaded'));
			//productDataLoaded.add(updateView('ProductDataLoaded'));
		}
		
		private function updateView(product:Product):void
		{
			trace("Signal for product button: " + product.ProductName);
			view.currentState=product.ProductName;
			
				
				
		}
		
	}
}