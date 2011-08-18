package shinydesign.boilerroom.model
{
	import mx.collections.ArrayCollection;
	
	import shinydesign.boilerroom.model.vo.Product;
	import shinydesign.boilerroom.signals.SelectedProductSignal;
	import shinydesign.boilerroom.utils.Logger;

	public class ProductsModel
	{
		[Inject]
		public var selectedProductSignal:SelectedProductSignal;
		
		[Inject]
		public var logger:Logger;
		
		private var _CurrentProduct:Product;
		private var _Products:ArrayCollection=new ArrayCollection();
		
		public function get Products():ArrayCollection
		{
			return _Products;
		}

		public function set Products(value:ArrayCollection):void
		{
			_Products = value;
		}

		public function get CurrentProduct():Product
		{
			return _CurrentProduct;
		}

		public function set CurrentProduct(value:Product):void
		{
			_CurrentProduct = value;
			//dispatch signal
			logger.debug("Products Model >> Dispatching Product Set Signal");
			selectedProductSignal.dispatch(value);
		}

	}
}