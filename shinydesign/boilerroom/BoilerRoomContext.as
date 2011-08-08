package shinydesign.boilerroom
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;
	
	import shinydesign.boilerroom.controller.LoadAllProductsCommand;
	import shinydesign.boilerroom.controller.LoadAllTemplatesCommand;
	import shinydesign.boilerroom.controller.LoadConfigCommand;
	import shinydesign.boilerroom.controller.LoadCurrentUserCommand;
	import shinydesign.boilerroom.controller.LoadProductCommand;
	import shinydesign.boilerroom.controller.LoadTourInfoCommand;
	import shinydesign.boilerroom.controller.PostContentToServerCommand;
	import shinydesign.boilerroom.controller.ProcessTemplatesCommand;
	import shinydesign.boilerroom.controller.SendItineraryToServerCommand;
	import shinydesign.boilerroom.controller.StartupCommand;
	import shinydesign.boilerroom.controller.UpdateContentCommand;
	import shinydesign.boilerroom.controller.UpdateSelectedTemplateCommand;
	import shinydesign.boilerroom.model.ApplicationConfigModel;
	import shinydesign.boilerroom.model.CurrentUserModel;
	import shinydesign.boilerroom.model.ProductsModel;
	import shinydesign.boilerroom.model.TemplatesModel;
	import shinydesign.boilerroom.model.ToursModel;
	import shinydesign.boilerroom.model.vo.BrowserVariables;
	import shinydesign.boilerroom.services.BrowserService;
	import shinydesign.boilerroom.services.ConfigService;
	import shinydesign.boilerroom.services.IBrowserService;
	import shinydesign.boilerroom.services.IConfigService;
	import shinydesign.boilerroom.services.dominodata.LoadAllProducts;
	import shinydesign.boilerroom.services.dominodata.LoadAllTemplatesService;
	import shinydesign.boilerroom.services.dominodata.LoadAllToursService;
	import shinydesign.boilerroom.services.dominodata.LoadTourInformationService;
	import shinydesign.boilerroom.services.dominodata.SendContentService;
	import shinydesign.boilerroom.services.dominodata.user.CurrentUserService;
	import shinydesign.boilerroom.signals.ApplicationConfigLoadedSignal;
	import shinydesign.boilerroom.signals.ApplicationStateChangeSignal;
	import shinydesign.boilerroom.signals.BrowserIsReadySignal;
	import shinydesign.boilerroom.signals.BrowserNameSetSignal;
	import shinydesign.boilerroom.signals.ContentProcessedSignal;
	import shinydesign.boilerroom.signals.ContentToBeParsedChangedSignal;
	import shinydesign.boilerroom.signals.CurrentTourSetSignal;
	import shinydesign.boilerroom.signals.CurrentUserLoadedSignal;
	import shinydesign.boilerroom.signals.DragStartedSignal;
	import shinydesign.boilerroom.signals.PostContentToServerSignal;
	import shinydesign.boilerroom.signals.ProcessContentSignal;
	import shinydesign.boilerroom.signals.ProductDataLoadedSignal;
	import shinydesign.boilerroom.signals.ProductInfoLoadedSignal;
	import shinydesign.boilerroom.signals.ProductsLoadedSignal;
	import shinydesign.boilerroom.signals.SelectedProductSignal;
	import shinydesign.boilerroom.signals.SelectedTemplateSignal;
	import shinydesign.boilerroom.signals.SendContentResultSignal;
	import shinydesign.boilerroom.signals.SendItineraryToServerSignal;
	import shinydesign.boilerroom.signals.TemplatesLoadedSignal;
	import shinydesign.boilerroom.signals.TourInfoLoadedSignal;
	import shinydesign.boilerroom.signals.ToursLoaded;
	import shinydesign.boilerroom.utils.LogPanelTarget;
	import shinydesign.boilerroom.utils.Logger;
	import shinydesign.boilerroom.views.admin.LogPanel;
	import shinydesign.boilerroom.views.contentparser.component.ContentToBeParsed;
	import shinydesign.boilerroom.views.contentparser.component.ParsedContent;
	import shinydesign.boilerroom.views.contentparser.component.Templates;
	import shinydesign.boilerroom.views.contentparser.component.TemplatesTarget;
	import shinydesign.boilerroom.views.mediators.BoilerRoomMediator;
	import shinydesign.boilerroom.views.mediators.ContentToBeParsedMediator;
	import shinydesign.boilerroom.views.mediators.LogPanelMediator;
	import shinydesign.boilerroom.views.mediators.ParsedContentMediator;
	import shinydesign.boilerroom.views.mediators.ProductContainerMediator;
	import shinydesign.boilerroom.views.mediators.ProductListMediator;
	import shinydesign.boilerroom.views.mediators.TargetTemplatesMediator;
	import shinydesign.boilerroom.views.mediators.TemplatesMediator;
	import shinydesign.boilerroom.views.mediators.TopBannerMediator;
	import shinydesign.boilerroom.views.mediators.TourInfoMediator;
	import shinydesign.boilerroom.views.mediators.ToursDataGridMediator;
	import shinydesign.boilerroom.views.product.ProductContainer;
	import shinydesign.boilerroom.views.product.ProductList;
	import shinydesign.boilerroom.views.product.tours.TourInformation;
	import shinydesign.boilerroom.views.product.tours.ToursDataGrid;
	import shinydesign.boilerroom.views.topbanner.TopBannerControls;
	
	public class BoilerRoomContext extends SignalContext
	{
		override public function startup():void
		{
			//Injections First
			injector.mapSingletonOf(IBrowserService,BrowserService); //Service via interface
			injector.mapSingletonOf(IConfigService,ConfigService); //Service via interface
			injector.mapSingleton(CurrentUserService);
			injector.mapSingleton(LoadAllTemplatesService);
			injector.mapSingleton(LoadAllProducts);
			injector.mapSingleton(LoadAllToursService);
			injector.mapSingleton(SendContentService);
			injector.mapSingleton(LoadTourInformationService);
			
			injector.mapSingleton(ApplicationConfigModel); //Model
			//injector.mapSingleton(ApplicationConfigLoaded); //Signal
			injector.mapSingleton(CurrentUserModel);
			injector.mapSingleton(TemplatesModel);
			injector.mapSingleton(ProductsModel);
			injector.mapSingleton(ToursModel);
			injector.mapSingleton(BrowserVariables);
			var logtmp:Logger=new Logger("shinydesign.boilerroom");
			injector.mapValue(Logger,logtmp);
			injector.mapSingleton(LogPanelTarget);
			//injector.mapSingleton(CurrentUserLoaded);
			injector.mapSingleton(BrowserNameSetSignal);
			
			injector.mapSingleton(TemplatesLoadedSignal);
			injector.mapSingleton(ContentProcessedSignal);
			injector.mapSingleton(SelectedTemplateSignal);
			injector.mapSingleton(ContentToBeParsedChangedSignal);
			injector.mapSingleton(DragStartedSignal);
			injector.mapSingleton(ProductsLoadedSignal);
			injector.mapSingleton(ApplicationStateChangeSignal);
			injector.mapSingleton(ToursLoaded);
			injector.mapSingleton(SelectedProductSignal);
			injector.mapSingleton(PostContentToServerSignal);
			injector.mapSingleton(SendContentResultSignal);
			injector.mapSingleton(CurrentTourSetSignal);
			injector.mapSingleton(TourInfoLoadedSignal);
			injector.mapSingleton(ProductDataLoadedSignal);
			injector.mapSingleton(ProductInfoLoadedSignal);
			injector.mapSingleton(SendItineraryToServerSignal);
			
			//Commands
			commandMap.mapEvent(ContextEvent.STARTUP,StartupCommand);
			
			signalCommandMap.mapSignalClass(BrowserIsReadySignal,LoadConfigCommand);
			signalCommandMap.mapSignalClass(ApplicationConfigLoadedSignal,LoadCurrentUserCommand);
			signalCommandMap.mapSignalClass(CurrentUserLoadedSignal,LoadAllTemplatesCommand);
			signalCommandMap.mapSignalClass(CurrentUserLoadedSignal,LoadAllProductsCommand);
			signalCommandMap.mapSignalClass(ProcessContentSignal,ProcessTemplatesCommand);
			signalCommandMap.mapSignalClass(SelectedTemplateSignal,UpdateSelectedTemplateCommand);
			signalCommandMap.mapSignalClass(ContentToBeParsedChangedSignal,UpdateContentCommand);
			signalCommandMap.mapSignalClass(SelectedProductSignal,LoadProductCommand);
			signalCommandMap.mapSignalClass(PostContentToServerSignal,PostContentToServerCommand);
			signalCommandMap.mapSignalClass(CurrentTourSetSignal,LoadTourInfoCommand);
			signalCommandMap.mapSignalClass(SendItineraryToServerSignal,SendItineraryToServerCommand);
			//views
			mediatorMap.mapView(TopBannerControls,TopBannerMediator);
			
			mediatorMap.mapView(Templates,TemplatesMediator);
			mediatorMap.mapView(TemplatesTarget,TargetTemplatesMediator);
			mediatorMap.mapView(ContentToBeParsed,ContentToBeParsedMediator);
			mediatorMap.mapView(ParsedContent,ParsedContentMediator);
			//Products
			mediatorMap.mapView(ProductList,ProductListMediator);
			mediatorMap.mapView(ToursDataGrid,ToursDataGridMediator);
			mediatorMap.mapView(TourInformation,TourInfoMediator);
			mediatorMap.mapView(ProductContainer,ProductContainerMediator);
			mediatorMap.mapView(LogPanel,LogPanelMediator);
			mediatorMap.mapView(BoilerRoom,BoilerRoomMediator);
			
			//Startup
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			trace("Context>> Finish");
		}
	}
}