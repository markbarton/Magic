package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.ProductsModel;
	
	public class ProductsLoadedSignal extends Signal
	{
		public function ProductsLoadedSignal()
		{
			super(ProductsModel);
		}
	}
}