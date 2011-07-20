package shinydesign.boilerroom.utils
{
	import mx.collections.ArrayCollection;
	
	import shinydesign.boilerroom.model.vo.Rule;
	import shinydesign.boilerroom.model.vo.Template;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;

	public class ProcessTemplates
	{
		[Inject]
		public var contentProcessed:ContentProcessedSignal;
	
		//Single Template for testing
		private var _testTemplate:Template;
		
		//Array Collection of Template Objects
		private var _Templates:ArrayCollection
		
		public function ProcessTemplates()
		{
		}

		public function get testTemplate():Template
		{
			return _testTemplate;
		}

		public function set testTemplate(value:Template):void
		{
			_testTemplate = value;
		}

		//Test Method
		public function processTest(content:String):void{
			var workingContent:String=content;
			//Remove any dodgy characters
			workingContent=stripAscii(workingContent);
			//Fix Line Length
			workingContent=truncateContent(workingContent,69,true);	
			
		//Caution maybe no templates - if all have been dragged out
			if(Templates.length!=0)
			{
			
		for each(var obj:Object in Templates){
				
			var template:Template=new Template;
			var pattern:RegExp;
			template.Title=obj.Title;
			template.UNID=obj.UNID;
			template.Rules=obj.Rules;
			for each(var rule:Rule in template.Rules){
				//Each rule will br run against the content
				//The rule type will determine now its processed
				for(var i:Number=0;i<rule.Repeat;i++){
					
				
				switch (rule.RuleType)
				{
					case rule.RULE_TEXT:
						var textToFind:String=rule.TextToFind;
						
						if(rule.ParitalMatch==false){
							textToFind="\\b"+textToFind+"\\b";	
							
						}else if(rule.PartialStart==true){
							textToFind="\\b"+textToFind;
						}else if(rule.PartialEnd==true){
							textToFind=textToFind+"\\b";
						}
						
						var caseSensitive:String;
						if(rule.CaseSensitive)
							caseSensitive="";
						else
							caseSensitive="i";
						
						pattern = new RegExp(textToFind,"mg"+caseSensitive);
						trace("TEXT RULE - REGEX" + textToFind +" ,mg"+caseSensitive);
						
						workingContent=workingContent.replace(pattern,rule.TextToReplace);
						break;
					case rule.RULE_REGEX:
						//REG EX TO run
						//pattern = new RegExp(rule.RegEx,rule.RegExFlags);
						pattern = new RegExp(rule.RegEx,rule.RegExFlags);
						
						trace("REGEX RULE - REGEX " + rule.RegEx +","+rule.RegExFlags);
						
						workingContent=workingContent.replace(pattern,rule.TextToReplace);
						break;
					case rule.RULE_STATIC:
						//Add Static Text either at the begining or end
						if(rule.InsertTextPosition=="Start"){
							workingContent=rule.TextToReplace + workingContent;
						}else{
							workingContent=workingContent + rule.TextToReplace;
						}
						trace("STATIC TEXT RULE");
						break;
					case rule.RULE_TRUNCATE:
						//Truncate text either at the begining or end ofthe content
						if(rule.TruncatePosition=="Start"){
							if(rule.TruncateType=="Length"){
								//Remove x number of chars from the string
								workingContent=workingContent.substr(rule.TruncateLength,workingContent.length)
							}else{
								var testString:String=workingContent.substr(0,rule.TruncateReplace.length);
								if(testString==rule.TruncateReplace)
									workingContent=workingContent.substr(rule.TruncateReplace.length,workingContent.length)
							}	
						}else{
							//Deal with the end of the text
							if(rule.TruncateType=="Length"){
								//Remove x number of chars from the string
								workingContent=workingContent.substr(0,workingContent.length-rule.TruncateLength)
							}else{
								var testString:String=workingContent.substr(workingContent.length-rule.TruncateReplace.length);
								if(testString==rule.TruncateReplace)
									workingContent=workingContent.substr(0,workingContent.length-rule.TruncateReplace.length)
							}	
							
						}
						trace("TRUNCATE RULE " + rule.TruncatePosition + " > " + rule.TruncateType);
						
						break;
				}
				}
			
				
				
				//System.setClipboard(workingContent);
				
			}//End Rule
			
			
			}//End Template
			
			}//End check for templates
			
		
			//dispatch signal
			trace("dispatching signal contentProcessed >> " + workingContent);
			contentProcessed.dispatch(workingContent)
		}
		
		
		private function padSentence(sentence:String):String{
			//This function will take the string and add enough spaces to make it 70 characters
			//for(var p:Number=sentence.length;p<69;p++){
				//sentence+="*";
			//}
			return sentence;
		}
		
		private function truncateContent(workingContent:String,maxLength:Number,wordWrap:Boolean):String{
			var words:Array = new Array();
			var letters:Array = new Array();
			var sentanceSplit:Array = new Array();
			sentanceSplit=workingContent.split("\n");
			
			letters=workingContent.split("");
			
			//Output Sentences
			var mySentences:Array = new Array();
			var currentWord:String="";
			var currentSentance:String="";
			var currentWordLength:Number=0;
			var maxLength:Number = maxLength;
			var sentenceLength:Number=0;
			var sentence:String="";
			var checkArray:Array=new Array();
			var currentCharString:String;
			var currentAsc:Number;
			//Loop through each word - check the total character length as we go
			//if it exceeds the max length then add to sentance array and continue
			
			for(var i:Number=0;i<sentanceSplit.length;i++){
				sentence="";
				currentWord="";
			currentSentance=sentanceSplit[i];
			if(currentSentance.length<=maxLength){
				if(currentSentance=="")
					currentSentance="*";
				//Sentance is shorter than max lenght so pad it with spaces
				mySentences.push(padSentence(currentSentance));
				
			}else{
				//Sentenance is longer than max length so we need to loop through words
				words=currentSentance.split(" ");
				sentenceLength=0
				for(var p:Number=0;p<words.length;p++){
					currentWord=words[p];
					if(sentenceLength==0)
						sentenceLength+=currentWord.length;
					else
						sentenceLength+=currentWord.length +1; //Allow for the space
					
					if(sentenceLength>maxLength){
						//Too long so push sentance
						mySentences.push(padSentence(sentence));	
						sentence=currentWord;
						sentenceLength=currentWord.length;
					}
					else{
						//Add word to temporary sentance holder
						if(sentence=="")
							sentence=currentWord;
						else
							sentence=sentence + " " + currentWord;
					}
					
				}
				if(sentence!="")
					mySentences.push(padSentence(sentence));
				}
			}
			
			var processedText:String="";
			//Seralise the sentance array
			for(var j:Number=0; j<mySentences.length; j++){
				if(j==mySentences.length-1){
					processedText+=mySentences[j]
					
				}else{
					processedText+=mySentences[j] +"\n";
						
				}
			}
			return processedText;
		}
		
		private function stripAscii(workingContent:String):String{
		
				var i:int=0;
				var myArray:Array = new Array();
				myArray = workingContent.split("");
				var currentCharString:String = "";
				var processedText:String="";
				var currentAsc:Number=0;
				for(var j:Number=0;j<myArray.length;j++){
					currentCharString=myArray[j];
					currentAsc=currentCharString.charCodeAt(0);
					//Begin ASC Mapping
					//Standard charcters
					if(currentAsc>31 && currentAsc<127 && currentAsc!=92 && currentAsc!=58)
						processedText+=currentCharString;
					//Special charcters
					//newline
					if(currentAsc==13||currentAsc==10)
						processedText+=currentCharString;
					//Tab
					if(currentAsc==9)
						processedText+=" @ ";
							
				}
				return processedText;
		}
		
		public function process(content:String):void{
			//Loop through Templates
			for each(var template:Template in Templates)
			{
			//Loop through each rule and process it
				for each(var rule:Rule in template.Rules)
				{
					trace("RULE >> " + rule.NOTEID);
					
				}
			}
			
		}
		
		public function replaceString(str:String, find:String, replace:String):String {
			var startIndex:Number = 0;
			var oldIndex:Number = 0;
			var newString:String = "";
			
			while ((startIndex = str.indexOf(find, startIndex)) != -1) {
				newString += str.substring(oldIndex, startIndex) + replace;
				oldIndex = startIndex += find.length;
			}
			
			return((newString == "") ? str : newString);
		}
		
		public function get Templates():ArrayCollection
		{
			return _Templates;
		}

		public function set Templates(value:ArrayCollection):void
		{
			_Templates = value;
		}

	}
}