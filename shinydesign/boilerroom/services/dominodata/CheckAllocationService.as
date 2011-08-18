package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.signals.AllocationReturnSignal;

	public class CheckAllocationService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var allocationReturnSignal:AllocationReturnSignal;
		
		
		//Implement the handleresult method as we want to use our specific parser
			override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			
			CursorManager.removeBusyCursor();
			var result:String;
			for each(var obj:XML in event.result)
			{
				result=obj.allocation;
			}
			logger.debug("CheckAllocationService >> handleresult >> " + result);
			
				
			
			allocationReturnSignal.dispatch(result);
			super.handleServiceResult(event,endPointKey);
		}
	}
}