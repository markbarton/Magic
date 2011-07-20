package shinydesign.boilerroom.model
{
	import org.robotlegs.mvcs.Actor;
	
	import shinydesign.boilerroom.model.vo.CurrentUser;
	
	public class CurrentUserModel extends Actor
	{
		private var _currentUser:CurrentUser;
		
		
		public function get currentUser():CurrentUser
		{
			return _currentUser;
		}

		public function set currentUser(value:CurrentUser):void
		{
			_currentUser = value;
		}
		
		public function buildRolesFromString(roles:String,delimiter:String):void{
			//This method will build an array of roles from a string list
			//Useful when passing roles via the flash vars
			//it expects the role names to be split via a comma and no [ ]
			var tmpRoles:Array=roles.split(delimiter);
			var holdingArray:Array=new Array;
			for each(var tmpRole:String in tmpRoles){
				holdingArray.push(tmpRole);
			}
			this.currentUser.AccessRoles=holdingArray;		
		}
		
		public function isMember(rolename:String):Boolean{
			//Check to see if the current user has this role
			//@ismember 
			var check:Boolean=false;
			var tmpLength:int=this.currentUser.AccessRoles.length
			for(var i:int=0;i<tmpLength;i++){	
				if(this.currentUser.AccessRoles[i]==rolename)
					check=true;
			}
			return check;
			
		}

	}
}