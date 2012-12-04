package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.model.AppModel;

import flash.events.Event;

import starling.display.Sprite;
import starling.events.Event;

public class PageSelector extends Sprite
{
    private var appModel:AppModel;

    private var arrowContainer:Sprite;
    private var nextButton:NextButton;
    private var prevButton:PrevButton;

    private var magazineContainer:Sprite;


    public function PageSelector()
    {
        this.appModel = AppModel.getInstance();

        nextButton = new NextButton();
        prevButton = new PrevButton();

        arrowContainer = new Sprite();
        arrowContainer.addChild(nextButton);
        arrowContainer.addChild(prevButton);
        arrowContainer.x = 205;
        arrowContainer.y = 205;
        addChild(arrowContainer);

        nextButton.addEventListener(starling.events.Event.TRIGGERED, nextClickHandler);
        prevButton.addEventListener(starling.events.Event.TRIGGERED, prevClickHandler);

        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler)
    }

    private function nextClickHandler(e:starling.events.Event):void
    {
        appModel.goToNextPage();
    }

    private function prevClickHandler(e:starling.events.Event):void
    {
        appModel.goToPrevPage();
    }

    private function pagesChangedHandler(e:flash.events.Event):void
    {
        displayCurrentImage();
    }

    private function currentPageChangedHandler(event:flash.events.Event):void
    {
        displayCurrentImage();
    }

    private function displayCurrentImage():void
    {
        if(magazineContainer != null)
        {
            removeChild(magazineContainer);
        }

        magazineContainer = new Sprite();
        magazineContainer.x = 258;
        magazineContainer.y = 20;
        var page:Page = new Page(appModel.currentPage);
        magazineContainer.addChild(page);
        addChild(magazineContainer);
    }
}
}