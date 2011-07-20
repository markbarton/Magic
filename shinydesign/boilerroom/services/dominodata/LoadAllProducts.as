package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.ProductsModel;
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.signals.ProductsLoadedSignal;

	public class LoadAllProducts extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var productsModel:ProductsModel; //The view
		[Inject]
		public var productsLoaded:ProductsLoadedSignal;
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			
			CursorManager.removeBusyCursor();
			trace("Service >> LoadAllProducts");
			
			for each(var obj:XML in event.result.product)
			{
				var product:Product=new Product();
				product.ProductName=obj.valueOf();
				//Add to array collection
				productsModel.Products.addItem(product);
			}
			
			//Dispatch Signal indicating we have updated the products model	
			productsLoaded.dispatch(productsModel);
		}
	}
}