package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.view.ImageLoader;
import be.devine.cp3.iBook1.vo.PageVO;

import flash.display.Sprite;

import flash.events.Event;

import starling.display.Sprite;


public class Application extends Sprite
{
    private var appModel:AppModel;
    private var selectedImage:ImageLoader;


    public function Application()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler);

        //selectedImage = new ImageLoader();
        addChild(selectedImage);

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
            //selectedImage.load(appModel.currentPage.path);
        }
    }
}
}
