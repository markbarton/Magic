package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;
	
	import shinydesign.boilerroom.signals.SendContentResultSignal;

	public class SendContentService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var sendContentResultSignal:SendContentResultSignal;
		public var OriginID:String;
		
		public function SendContentService()
		{
			super();
		}
		
		//Override the send method - we are posting this time
		public function sendDominoData(EPKey:String=null,content:String=null):void
		{trace("Service >> SendContent >> getDominoData >>" + EPKey + " >> " + OriginID);
			//Add busy cursor
			CursorManager.setBusyCursor();	
			//Get EndPoint from value if passed - else from class property - else we can not continue
			this.EndPointKey=EPKey;
			var endURL:String;
			endURL=	applicationConfigModel.applicationConfig.URLEndPoints.getValue(EPKey);
			
			trace("EndPoint = "+endURL);
			
			//Attempt to login to the server
			//Currently assume session based authentication
			var service:HTTPService = new HTTPService();
			
			//POST in this case
			service.method="POST";
			
			var responder:AsyncResponder = new AsyncResponder(handleServiceResult, handleServiceFault,this.EndPointKey);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			service.url = applicationConfigModel.applicationConfig.RemoteDominoServer + endURL;
			//prevent caching    
			params.nocache=Math.round(Math.random()*1000);
			params.content=content;
			//Need debugging information i.e. where did the content come from
			params.originid=OriginID;
			//These will be posted  - values set via the command which has this service injected into it  
			token = service.send(params);
			token.addResponder(responder);
			
		}
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			CursorManager.removeBusyCursor();
			trace("Service >> SendContent >> Result >> " + OriginID);
			//Dispatch signal with result
			
			var result:Boolean;
			if(event.result.flag=="true")
				result=true;
			else
				result=false;	
			
			sendContentResultSignal.dispatch(result,OriginID);
		}
	}
}