package shinydesign.boilerroom.signals
{
	import org.osflash.signals.Signal;
	
	import shinydesign.boilerroom.model.vo.PostContent;
	
	public class PostContentToServerSignal extends Signal
	{
		public function PostContentToServerSignal()
		{
			//Content & Origin ID
			super(PostContent);
		}
	}
}