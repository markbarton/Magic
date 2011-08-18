package shinydesign.boilerroom.views.components.container
{
	import shinydesign.boilerroom.signals.LoadingFrameSignal;
	import shinydesign.boilerroom.utils.Logger;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	[SkinState("loading")]
	[SkinState("dataLoaded")]
	public class LoadingPane extends SkinnableContainer
	{
		
		[SkinPart(required="false")]
		public var LoadingLabel:Label;
		
		private var _loading:Boolean; //Skin State flag
		private var _dataLoaded:Boolean; //Skin State Flag
		private var _loadingTitle:String;  //Optional loading title
		private var _frameIdentifier:String //Used as the identifier for the data loading signal / data loaded signal
	
		
		[Inject]
		public var loadingFrameSignal:LoadingFrameSignal;


		public function get frameIdentifier():String
		{
			return _frameIdentifier;
		}

		public function set frameIdentifier(value:String):void
		{
			_frameIdentifier = value;
		}

		public function get loadingTitle():String
		{
			return _loadingTitle;
		}

		public function set loadingTitle(value:String):void
		{
			_loadingTitle = value;
		}


		public function get loading():Boolean
		{
			return _loading;
		}

		public function set loading(value:Boolean):void
		{
			if(_loading !=value){
				trace("loading flag being set");
				_loading=value;
				_dataLoaded=false;
				invalidateSkinState();
			}
		}

		public function get dataLoaded():Boolean
		{
			return _dataLoaded;
		}

		public function set dataLoaded(value:Boolean):void
		{
				_dataLoaded = value;
				_loading=false;
				invalidateSkinState();
		}
		
		public function setNormal():void{
			loading=false;
			dataLoaded=false;
			invalidateSkinState();
				
		}
		
		//If we currently loading then return this flag
		override protected function getCurrentSkinState():String {
			if(dataLoaded)
				return 'dataLoaded';
			if(loading)
				return 'loading'
			return 'normal';
			
		}
		
		//Add the loading text if the label is being added to the skin
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == LoadingLabel) {
				LoadingLabel.text=loadingTitle;
			}
		}
	
		public function LoadingPane()
		{
			super();
		}
	}
}