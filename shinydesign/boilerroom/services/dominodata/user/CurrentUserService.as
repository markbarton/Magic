package shinydesign.boilerroom.services.dominodata.user
{
	import mx.managers.CursorManager;
	
	import shinydesign.boilerroom.model.CurrentUserModel;
	import shinydesign.boilerroom.model.vo.CurrentUser;
	import shinydesign.boilerroom.services.dominodata.DominoXMLService;
	import shinydesign.boilerroom.services.dominodata.IDominoXMLService;
	import shinydesign.boilerroom.signals.CurrentUserLoadedSignal;
	public class CurrentUserService extends DominoXMLService implements IDominoXMLService
	{
		[Inject]
		public var currentUserModel:CurrentUserModel;
		
		[Inject]
		public var currentUserLoaded:CurrentUserLoadedSignal;
		
		public function CurrentUserService()
		{ 
			super();
		}
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
		
			CursorManager.removeBusyCursor();
			trace("Service >> CurrentUserService");
				
				var currentUser:CurrentUser=new CurrentUser;
				for each(var obj:XML in event.result)
				{
					currentUser.UserName=obj.username;
					currentUser.CommonUserName=obj.commonusername;
					currentUser.AccessRoles=new Array();
					for each(var role:String in event.result.userroles.userrole)
					{
						currentUser.AccessRoles.push(role);
					}
					
				}
				//Update Model
				currentUserModel.currentUser=currentUser;
				//Dispatch Event indicating model has been updated
				//dispatch(new UserEvent(UserEvent.USER_MODEL_UPDATED));
				trace("Current User = " + currentUser.CommonUserName);
				currentUserLoaded.dispatch(); //dispatch signal
	}
	}
}