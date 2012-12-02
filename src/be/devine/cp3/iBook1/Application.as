package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.view.ImageLoader;
import be.devine.cp3.iBook1.view.TextLoader;

import flash.events.Event;
import starling.display.Sprite;

public class Application extends starling.display.Sprite
{
    private var appModel:AppModel;
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
        }
    }
}
}
