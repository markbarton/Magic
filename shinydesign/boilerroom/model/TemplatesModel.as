package shinydesign.boilerroom.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.ProcessContentSignal;
	import shinydesign.boilerroom.utils.HashMap;
	import shinydesign.boilerroom.utils.HashMapEntry;
	
	public class TemplatesModel extends Actor
	{
		[Inject]
		public var processContentSignal:ProcessContentSignal;
		
		private var _Templates:HashMap=new HashMap;
		private var TemplateList:ArrayCollection=new ArrayCollection;//Current list of unselected Templates
		private var _SelectedTemplateList:ArrayCollection=new ArrayCollection; //List of Selected Templates
		private var _Content:String=""; //The content that is to be parsed
		private var _ParsedContent:String; //The content that has been parsed;
		
		public function get SelectedTemplateList():ArrayCollection
		{
			return _SelectedTemplateList;
		}

		public function set SelectedTemplateList(value:ArrayCollection):void
		{
			_SelectedTemplateList = value;
		}

		public function get ParsedContent():String
		{
			return _ParsedContent;
		}

		public function set ParsedContent(value:String):void
		{
			_ParsedContent = value;
		}

		public function get Content():String
		{
			return _Content;
		}

		public function set Content(value:String):void
		{
			_Content = value;
			//Dispatch Signal
			processContentSignal.dispatch(this)
		
				
		}

		public function get AllTemplates():ArrayCollection
		{
			var tmp:ArrayCollection=new ArrayCollection;
			for each(var item:HashMapEntry in _Templates.getEntries())
			{
				tmp.addItem(item.value);
			}
			return tmp;
		}
		
		public function get Templates():HashMap{
			return _Templates;
		}
		public function set Templates(value:HashMap):void
		{
			_Templates = value;
		}
		
		public function AddSelectedTemplate(template:Template):void{
			//Will add the template to the selected template list
		
			SelectedTemplateList.addItem(template);
			//Remove from the unslected list
			RemoveTemplate(template);
			//Dispatch Signal if we have content to be parsed
			if(Content!="")
				processContentSignal.dispatch(this)
				
		}
		
		public function RemoveSelectedTemplate(template:Template):void{
			//Will remove the selected template from the selected template list
			//Will remove the template from the unselected Template List
			var counter:int=0;
			for each(var templateObj:Template in SelectedTemplateList){
				if(template.UNID==templateObj.UNID)
					SelectedTemplateList.removeItemAt(counter);
				counter+=1;
			}
			//Add to the unselected list
			AddTemplate(template);
			//Dispatch Signal if we have content to be parsed
			if(Content!="")
				processContentSignal.dispatch(this)
		}
		
		public function AddTemplate(template:Template):void{
			//Will add the template to the unselected Template list
			TemplateList.addItem(template);
		}
		
		public function RemoveTemplate(template:Template):void{
			//Will remove the template from the unselected Template List
			var counter:int=0;
			for each(var templateObj:Template in TemplateList){
				if(template.UNID==templateObj.UNID)
					TemplateList.removeItemAt(counter);
				counter+=1;
			}
			
		}
		
		
	}
}