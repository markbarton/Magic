package com.adobe.ac.logging
{
	import shinydesign.boilerroom.utils.XPanelDebugTarget;

	public class XPanelError implements GlobalExceptionHandlerAction
	{
		
		
		public function handle(error:Object):void
		{
			if (error is Error)
		{
			var errorObj:Error = error as Error;
			var xPanelDebugTarget:XPanelDebugTarget=new XPanelDebugTarget();
			
			
			xPanelDebugTarget.logGlobalError(errorObj)
			
		}
		}
	}
}