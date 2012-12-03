package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.service.PageService;
import be.devine.cp3.iBook1.view.ImageLoader;
import be.devine.cp3.iBook1.view.PageSelector;
import be.devine.cp3.iBook1.view.TextLoader;

import flash.events.Event;
import starling.display.Sprite;

public class Application extends starling.display.Sprite
{
    private var appModel:AppModel;
    private var pageService:PageService;

    private var pageSelector:PageSelector;
    private var selectedImage:ImageLoader;
    private var selectedText:TextLoader;

    public function Application()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler);

        selectedImage = new ImageLoader();
        addChild(selectedImage);

        selectedText = new TextLoader();
        addChild(selectedText);

        pageSelector = new PageSelector();
        addChild(pageSelector);

        pageService = new PageService();
        pageService.addEventListener(Event.COMPLETE, pagesCompleteHandler);
        pageService.load();
    }

    private function pagesCompleteHandler(event:Event):void {
        appModel.pages = pageService.pages;
        appModel.currentPage = pageService.pages[0];
    }

    private function pagesChangedHandler(event:Event):void
    {
        displayCurrentImage();
    }

    private function currentPageChangedHandler(event:Event):void
    {
        displayCurrentImage();
    }

    private function displayCurrentImage():void
    {
        if(appModel.currentPage)
        {
            //De data van de pagina inladen
            selectedImage.load(appModel.currentPage.image);
            selectedText.loadTitle(appModel.currentPage.title);
            selectedText.loadText(appModel.currentPage.text);
        }
        else
        {
            trace('LEGE SPOT IN XML');
        }
    }
}
}
