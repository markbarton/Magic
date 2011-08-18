package shinydesign.boilerroom.services.dominodata
{
	import images.ImageAsset;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.http.HTTPService;
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.model.vo.LoadingFrame;
	import shinydesign.boilerroom.services.dominodata.IDominoXMLService;
	import shinydesign.boilerroom.signals.LoadingFrameSignal;
	import shinydesign.boilerroom.utils.Logger;
	
	public class DominoXMLService extends Actor implements IDominoXMLService
	{
		private var _EndPointKey:String;
		private var _params:Object=new Object;
		private var _frameIdentifier:String;
		private var loadingFrame:LoadingFrame=new LoadingFrame();
		public function get frameIdentifier():String
		{
			return _frameIdentifier;
		}

		public function set frameIdentifier(value:String):void
		{
			_frameIdentifier = value;
		}

		
		[Inject]
		public var applicationConfigModel:ApplicationConfigModel;
		//We need the application config model as it will tell us where the endpoint is
		
		[Inject]
		public var logger:Logger; //For all logging
		
		[Inject]
		public var loadingFrameSignal:LoadingFrameSignal; //Used to dispatch when something is loaded / loaded for the loading frame components
		
		public function get params():Object
		{
			return _params;
		}

		public function set params(value:Object):void
		{
			_params = value;
		}

		public function get EndPointKey():String
		{
			return _EndPointKey;
		}

		public function set EndPointKey(value:String):void
		{
			_EndPointKey = value;
		}

		public function getDominoData(EPKey:String=null):void
		{
			logger.debug("Service >> DominoData >> getDominoData >> EndPointKey >> " + EPKey);
			updateLoadingFrame(loadingFrame.LOADING_STATE);
			//Add busy cursor
			CursorManager.setBusyCursor();	
			//Get EndPoint from value if passed - else from class property - else we can not continue
			this.EndPointKey=EPKey;
			var endURL:String;
			endURL=	applicationConfigModel.applicationConfig.URLEndPoints.getValue(EPKey);
			logger.debug("Service >> DominoData >> getDominoData >> EndPointURL >> " + endURL);
			
			
			//Attempt to login to the server
			//Currently assume session based authentication
			var service:HTTPService = new HTTPService();
			var responder:AsyncResponder = new AsyncResponder(handleServiceResult, handleServiceFault,this.EndPointKey);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			service.url = applicationConfigModel.applicationConfig.RemoteDominoServer + endURL;
			//prevent caching    
				params.nocache=Math.round(Math.random()*1000);
			//These will be posted  - values set via the command which has this service injected into it  
			token = service.send(params);
			//log.debug("Service >> DominoData >> getDominoData >> params >> " + ObjectUtil.toString(params));
			
			token.addResponder(responder);
			
		}
		
		public function updateLoadingFrame(state:String):void{
			//Dispatch loading frame signal with loading frame VO set with correct properties
		
			loadingFrame.frameIdentifier=this.frameIdentifier;
			loadingFrame.state=state;
			loadingFrameSignal.dispatch(loadingFrame);
			logger.debug("Dispatched Loading Frame Signal : " + this.frameIdentifier + " with state: " + loadingFrame.LOADING_STATE);
		}
		
		public function handleServiceResult(event:Object,endPointKey:String):void
		{	
		updateLoadingFrame(loadingFrame.DATA_LOADED);	
		}
		
		public function handleServiceFault(event:Object,endPointKey:String):void
		{	logger.error("Error - Service >> DominoData >> " + endPointKey + " >> " + event.fault.faultString);	
			Alert.show("Problem getting data from server for endpoint: " + endPointKey + "\n\nPlease contact Systems for help\n\nError: " + event.fault.faultString,"Failure",4,null,null,images.ImageAsset.FailureIcon);
			CursorManager.removeBusyCursor();
			//Dispatch an error loading Frame State
			var loadingFrame:LoadingFrame=new LoadingFrame();
			loadingFrame.frameIdentifier=this.frameIdentifier;
			loadingFrame.state=loadingFrame.DATA_ERROR;
			loadingFrameSignal.dispatch(loadingFrame);
			
		}
	}
}