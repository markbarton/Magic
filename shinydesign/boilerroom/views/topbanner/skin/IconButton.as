package shinydesign.boilerroom.views.topbanner.skin
{
	import spark.components.Button;
	import spark.primitives.BitmapImage;
	import spark.primitives.supportClasses.GraphicElement;
	
	[SkinState("active")]
	public class IconButton extends Button
	{
		public function IconButton()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//    Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  icon
		//----------------------------------
		
		
		private var _normalIcon:Class;
		private var _overIcon:Class;
		private var _downIcon:Class;
		private var _activated:Boolean;
		
		public function get activated():Boolean
		{
			return _activated;
		}

		public function set activated(value:Boolean):void
		{
			if (_activated != value) {
				_activated = value;
				invalidateSkinState();
			}
			 
		}

		[Bindable]
		
		public function get downIcon():Class
		{
			return _downIcon;
		}

		public function set downIcon(value:Class):void
		{
			_downIcon = value;
			if (downIcon != null)
				downIcon.source = _downIcon;
		}

		public function get overIcon():Class
		{
			return _overIcon;
		}

		public function set overIcon(value:Class):void
		{
			_overIcon = value;
			if (overIcon != null)
				overIcon.source = _overIcon;
			
		}

		/**
		 *  @private
		 *  Internal storage for the icon property.
		 */
		public function get normalIcon():Class
		{
			return _normalIcon;
		}

		/**
		 * @private
		 */
		public function set normalIcon(value:Class):void
		{
			_normalIcon = value;
			if (normalIcon != null)
				normalIcon.source = _normalIcon;
			
		}

	
		
		//--------------------------------------------------------------------------
		//
		//  Skin Parts
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="false")]
		public var normalIconImage:BitmapImage;
		[SkinPart(required="false")]
		public var overIconImage:BitmapImage;
		[SkinPart(required="false")]
		public var downIconImage:BitmapImage;
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(normalIconImage !==null && instance==normalIconImage)
				normalIconImage.source=normalIcon;
			if(downIconImage !==null && instance==downIconImage)
				downIconImage.source=downIcon;
			if(overIconImage !==null && instance==overIconImage)
				overIconImage.source=overIcon;
		}
		
		override protected function getCurrentSkinState():String {
			return (activated ? 'active' : super.getCurrentSkinState());
		}
	}
}