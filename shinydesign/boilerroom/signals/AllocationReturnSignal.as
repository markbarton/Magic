package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.Allocation;

	//Dispatched by the checkallocation service
	//Results in the view displaying a message if this is true
	public class AllocationReturnSignal extends Signal
	{
		public function AllocationReturnSignal(...parameters)
		{
			super(Allocation);
		}
	}
}