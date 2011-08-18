package shinydesign.boilerroom.services.dominodata
{
	public interface IDominoXMLService
	{
		function getDominoData(EndPointKey:String=null):void;
		function handleServiceResult(event:Object,endPointKey:String):void;
		function handleServiceFault(event:Object,endPointKey:String):void;
		function get EndPointKey():String;
		function set EndPointKey(value:String):void;
		function get params():Object;
		function set params(value:Object):void;
		function set frameIdentifier(value:String):void; //Used for disptaching a frameLoader event;
		function get frameIdentifier():String;
	}
}