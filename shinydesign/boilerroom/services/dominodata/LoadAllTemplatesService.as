package shinydesign.boilerroom.services.dominodata
{
	import mx.managers.CursorManager;
	import mx.utils.ObjectUtil;
	
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.vo.Rule;
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.TemplatesLoadedSignal;

	public class LoadAllTemplatesService extends DominoXMLService implements IDominoXMLService
	{
		
		[Inject]
		public var templatesModel:TemplatesModel;
		
		[Inject]
		public var templatesLoaded:TemplatesLoadedSignal;
		
		public function LoadAllTemplatesService()
		{
			super();
		}
		
		[PostConstruct]
		public function logStart():void{
			logger.debug("Service >> LoadAllTemplatesService Called");
			
		}
		
		//Implement the handleresult method as we want to use our specific parser
		override public function handleServiceResult(event:Object,endPointKey:String):void
		{
			
			CursorManager.removeBusyCursor();
				
			for each(var obj:XML in event.result.template)
			{
				var template:Template=new Template();
				
				template.Title=obj.title;
				template.UNID=obj.unid;
				template.Category=obj.category;
				template.Description=obj.description;
				for each(var ruleObj:XML in obj.rules.rule)
				{
					var rule:Rule=new Rule();
					rule.NOTEID=ruleObj.noteid;
					rule.TextToFind=ruleObj.texttofind;
					rule.TextToReplace=ruleObj.texttoreplace;
					rule.RuleTitle=ruleObj.ruletitle;
					if(ruleObj.casesensitive=="true")
						rule.CaseSensitive=true;
					else
						rule.CaseSensitive=false;
					
					if(ruleObj.partialmatch=="true")
						rule.ParitalMatch=true;
					else
						rule.ParitalMatch=false;
					
					if(ruleObj.partialstart=="true")
						rule.PartialStart=true;
					else
						rule.PartialStart=false;
					
					if(ruleObj.partialend=="true")
						rule.PartialEnd=true;
					else
						rule.PartialEnd=false;
					rule.RegEx=ruleObj.regex;
					rule.RegExFlags=ruleObj.regexflags;
					rule.InsertTextPosition=ruleObj.inserttextposition;
					if(ruleObj.type=="Text")
						rule.RuleType=rule.RULE_TEXT;
					if(ruleObj.type=="Static Content")
						rule.RuleType=rule.RULE_STATIC;
					if(ruleObj.type=="Regular Expression")
						rule.RuleType=rule.RULE_REGEX;
					if(ruleObj.type=="Truncate")
						rule.RuleType=rule.RULE_TRUNCATE;
					rule.Repeat=parseFloat(ruleObj.repeat);
					rule.TruncateType=ruleObj.truncatetype;
					rule.TruncateLength=parseFloat(ruleObj.truncatelength);
					rule.TruncatePosition=ruleObj.truncateposition;
					rule.TruncateReplace=ruleObj.truncatereplacestring;
					rule.Sequence=parseFloat(ruleObj.sequence);
					
					template.Rules.addItem(rule);
				}
				//Add to hashmap
				templatesModel.Templates.put(template.UNID,template);
				
				//Add to unselected tenmplates
				templatesModel.AddTemplate(template);
			}
			 
			logger.info("Service >> LoadAllTemplates >> Result");
			
		//Dispatch Signal indicating we have updated the templates model	
			templatesLoaded.dispatch(templatesModel);
		}
	}
}