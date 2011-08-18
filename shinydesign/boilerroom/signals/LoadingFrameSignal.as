package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	
	//This class is used to signal to loading frames
	//It will pass a loadingFrameVO which holds the required state & identiy as all loading frames will listen for this siganl
	
	public class LoadingFrameSignal extends Signal
	{
		public function LoadingFrameSignal(...parameters)
		{
			super(LoadingFrame);
		}
	}
}