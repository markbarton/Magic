package shinydesign.boilerroom.services
{
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.http.HTTPService;
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.model.vo.ApplicationConfig;
	import shinydesign.boilerroom.signals.ApplicationConfigLoadedSignal;
	import shinydesign.boilerroom.utils.HashMap;

	public class ConfigService extends Actor implements IConfigService
	{
		[Inject]
		public var appModel:ApplicationConfigModel;	
		
		[Inject]
		public var appConfigLoaded:ApplicationConfigLoadedSignal //Signal to tell everyone we have the app config loaded
		
		public function ConfigService()
		{
			trace("Service >> ConfigService");
		}
		
		public function loadConfig():void
		{
			trace("Service >> ConfigService >> LoadConfig"); 
			var service:HTTPService = new HTTPService();
			var responder:Responder = new Responder(handleServiceResult, handleServiceFault);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			//Get the config location from the AppModel via the Browser Variables 
			
			service.url = appModel.browserVariables.ConfigLocation;
			trace("Service >> ConfigService >> LoadConfig - URL =" +service.url);
			var params:Object=new Object;
			//params.nocache=Math.round(Math.random()*1000);
			token = service.send(params);
			token.addResponder(responder);
		}
		
		//We should move this out to a parsing class
		protected function handleServiceResult(event:Object):void{
			trace("Service >> ConfigService >> HandleServiceResult");
			//Get config from Model
			var config:ApplicationConfig=appModel.applicationConfig;
			
			config.RemoteDominoServer=event.result.RemoteDominoServer;
			config.AuthenticationLoginEndPoint=event.result.AuthenticationLoginEndPoint;
			config.LoginSuccessRedirection=event.result.LoginSuccessRedirection;
			if(event.result.AuthenticateUser=="true"){
				config.AuthenticateUser=true;	
			}else{
				config.AuthenticateUser=false;
			}
			//Loop through endpoints and put them in a hashmap
			config.URLEndPoints=new HashMap();
			
			var tmp:String="";
			
			for each(var endpoint:XML in event.result.URLEndPoints.EndPoint)
			{
				var Key:String=endpoint.Key;
				var Val:String=endpoint.URL;
				tmp+=Key + " >> " + Val +"\n";
				config.URLEndPoints.put(Key,Val);
			}
			config.URLEndPointsString=tmp;
			if(event.result.SearchMail=="true")
				config.SearchMail=true;
			else
				config.SearchMail=false;
			config.Version=event.result.Version;
			appConfigLoaded.dispatch(config);
						
		}
		
		protected function handleServiceFault(event:Object):void
		{
			trace(event);
			
		}
	}
}