package shinydesign.boilerroom.model.vo
{
	import mx.collections.ArrayCollection;

	/**
	 * This class is used for the template - a template has associated rules with it
	 * */
	[RemoteClass]
	public class Template
	{
		private var _UNID:String;
		private var _Title:String;
		private var _Rules:ArrayCollection=new ArrayCollection(); //Rules
		private var _Category:String;
		private var _Description:String;
		
		public function Template()
		{
		}


		public function get Category():String
		{
			return _Category;
		}

		public function set Category(value:String):void
		{
			_Category = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get UNID():String
		{
			return _UNID;
		}

		public function set UNID(value:String):void
		{
			_UNID = value;
		}

		public function get Title():String
		{
			return _Title;
		}

		public function set Title(value:String):void
		{
			_Title = value;
		}

		public function get Rules():ArrayCollection
		{
			return _Rules;
		}

		public function set Rules(value:ArrayCollection):void
		{
			_Rules = value;
		}

	}
}