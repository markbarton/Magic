package shinydesign.boilerroom.model.vo
{
	public class PostContent
	{
		private var _contentType:String;
		private var _content:String;
		
		public function PostContent()
		{
		}


		public function get contentType():String
		{
			return _contentType;
		}

		public function set contentType(value:String):void
		{
			_contentType = value;
		}

		public function get content():String
		{
			return _content;
		}

		public function set content(value:String):void
		{
			_content = value;
		}

	}
}