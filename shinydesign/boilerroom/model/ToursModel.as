package shinydesign.boilerroom.model
{
	import mx.collections.ArrayCollection;
	
	import shinydesign.boilerroom.model.vo.Tour;
	import shinydesign.boilerroom.signals.CurrentTourSetSignal;

	public class ToursModel
	{
		[Inject]
		public var currentTourSet:CurrentTourSetSignal;
		
		private var _CurrentTour:Tour;
		private var _Tours:ArrayCollection=new ArrayCollection;
		
		public function get Tours():ArrayCollection
		{
			return _Tours;
		}

		[Bindable]
		public function set Tours(value:ArrayCollection):void
		{
			_Tours = value;
		}

		public function get CurrentTour():Tour
		{
			return _CurrentTour;
		}

		public function set CurrentTour(value:Tour):void
		{
			_CurrentTour = value;
			trace("Selected Tour set: " + value.UNID);
			currentTourSet.dispatch(value);
		}

	}
}