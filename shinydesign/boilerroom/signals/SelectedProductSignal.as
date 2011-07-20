package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Product;
	
	public class SelectedProductSignal extends Signal
	{
		public function SelectedProductSignal()
		{
			super(Product);
		}
	}
}