package shinydesign.boilerroom.model.vo
{
	/**
	 * This represents the application config object
	 **/
	import shinydesign.boilerroom.utils.HashMap;
	
	[Bindable]
	public class ApplicationConfig
	{
 
		private var _RemoteDominoServer:String;
		private var _AuthenticateUser:Boolean;
		private var _AuthenticationLoginEndPoint:String;
		private var _LoginSuccessRedirection:String;
		private var _URLEndPoints:HashMap;
		private var _SearchMail:Boolean;
		
		public function get SearchMail():Boolean
		{
			return _SearchMail;
		}

		public function set SearchMail(value:Boolean):void
		{
			_SearchMail = value;
		}


		public function get URLEndPoints():HashMap
		{
			return _URLEndPoints;
		}

		//Hashes are built from when the data is parsed (child nodes)
		public function set URLEndPoints(value:HashMap):void
		{
			_URLEndPoints = value;
		}

		public function get LoginSuccessRedirection():String
		{
			return _LoginSuccessRedirection;
		}

		public function set LoginSuccessRedirection(value:String):void
		{
			_LoginSuccessRedirection = value;
		}

		public function get AuthenticationLoginEndPoint():String
		{
			return _AuthenticationLoginEndPoint;
		}

		public function set AuthenticationLoginEndPoint(value:String):void
		{
			_AuthenticationLoginEndPoint = value;
		}

		public function get AuthenticateUser():Boolean
		{
			return _AuthenticateUser;
		}

		public function set AuthenticateUser(value:Boolean):void
		{
			_AuthenticateUser = value;
		}

		public function get RemoteDominoServer():String
		{
			return _RemoteDominoServer;
		}

		public function set RemoteDominoServer(value:String):void
		{
			_RemoteDominoServer = value;
		}

	}
}