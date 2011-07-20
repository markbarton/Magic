package shinydesign.boilerroom.views.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	import shinydesign.boilerroom.model.ProductsModel;
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.signals.ProductsLoadedSignal;
	import shinydesign.boilerroom.views.product.ProductList;
	
	public class ProductListMediator extends Mediator
	{
		[Inject]
		public var view:ProductList; //View
		[Inject]
		public var productsLoaded:ProductsLoadedSignal; //Signal to indicate the products have been loaded
		[Inject]
		public var productsModel:ProductsModel; //Model for products
		
		override public function onRegister():void
		{ 
			view.tmpSignal.add(updateModel);
			productsLoaded.add(updateView);
			if(productsModel.Products.length!=0)
				updateView(productsModel);
		}
		
		private function updateModel(selectedProduct:Product):void
		{
			//Update Product Model with selected product
			productsModel.CurrentProduct=selectedProduct;
		}
		
		private function updateView(productsModel:ProductsModel):void
		{
			// TODO Auto Generated method stub
			view.Products.dataProvider=productsModel.Products;
		}
	}
}