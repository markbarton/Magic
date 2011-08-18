package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	//Dispatched by the checkallocation service
	//Results in the view displaying a message if this is true
	public class AllocationReturnSignal extends Signal
	{
		public function AllocationReturnSignal(...parameters)
		{
			super(String);
		}
	}
}