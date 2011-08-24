package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.vo.Allocation;
	import shinydesign.boilerroom.signals.AllocationReturnSignal;

	public class CheckAllocationService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var allocationReturnSignal:AllocationReturnSignal;
		
		
		//Implement the handleresult method as we want to use our specific parser
			override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			try{
			CursorManager.removeBusyCursor();
			var allocation:Allocation=new Allocation() ;
			for each(var obj:XML in event.result)
			{
				if(obj.allocationtype!=""){
					allocation.hasAllocation=true;
				allocation.allocationType=obj.allocationtype;
				allocation.matchingKey=obj.matchingkey;
				}
				else
				{allocation.hasAllocation=false;}
				
				if(obj.hasmulti=="true"){
					allocation.hasMulti=true;
					allocation.cruiseLines=obj.cruiselines;
				}
				else{
					allocation.hasMulti=false;
				allocation.cruiseLines="";		
				}
				
				
			}
			logger.debug("CheckAllocationService >> handleresult >> " + allocation.hasAllocation);
			allocationReturnSignal.dispatch(allocation);
			super.handleServiceResult(event,endPointKey);
			}catch(e:Error){
				logger.errorObj(e);
			}
		}
	}
}