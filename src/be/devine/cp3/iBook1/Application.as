package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.service.PageService;
import be.devine.cp3.iBook1.view.PageSelector;

import flash.events.Event;

import starling.display.Sprite;

public class Application extends starling.display.Sprite
{
    private var appModel:AppModel;
    private var pageService:PageService;

    private var pageSelector:PageSelector;

    public function Application()
    {
        appModel = AppModel.getInstance();

        pageSelector = new PageSelector();

        pageService = new PageService();
        pageService.addEventListener(Event.COMPLETE, pagesCompleteHandler);
        pageService.load();
    }

    private function pagesCompleteHandler(event:Event):void
    {
        appModel.pages = pageService.pages;
        addChild(pageSelector);
        appModel.currentPage = appModel.pages[0];
    }
}
}
