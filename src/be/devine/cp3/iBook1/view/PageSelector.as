package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.PageVO;

import com.greensock.TweenLite;
import flash.events.Event;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.textures.Texture;

public class PageSelector extends Sprite
{
    private var appModel:AppModel;

    [Embed(source="/../libs/magazineBg.png")]
    public static const MagazineBG:Class;
    private var magazineContainer:Sprite;

    private var listItems:Vector.<ListItems>;

    private var thumbnailContainerHolder:Sprite;
    private var thumbnailContainer:Sprite;
    private var thumbnailWidth:uint = 100;
    private var thumbnailMargin:uint = 10;
    private var thumbnails:Vector.<Thumbnail>;

    private var arrowContainer:Sprite;
    private var nextButton:NextButton;
    private var prevButton:PrevButton;

    public function PageSelector()
    {
        this.appModel = AppModel.getInstance();

        nextButton = new NextButton();
        prevButton = new PrevButton();

        var magazineBg:Texture = Texture.fromBitmap(new MagazineBG());
        var magazineBgImg:Image = new Image(magazineBg);
        magazineBgImg.x = 250;
        magazineBgImg.y = 10;
        addChild(magazineBgImg);

        thumbnailContainerHolder = new Sprite();
        thumbnailContainer = new Sprite();
        thumbnailContainerHolder.y = 465;
        thumbnailContainerHolder.x = 15;
        thumbnailContainerHolder.addChild(thumbnailContainer);
        addChild(thumbnailContainerHolder);
        thumbnails = new Vector.<Thumbnail>();

        arrowContainer = new Sprite();
        arrowContainer.addChild(nextButton);
        arrowContainer.addChild(prevButton);
        arrowContainer.x = 205;
        arrowContainer.y = 205;
        addChild(arrowContainer);

        nextButton.addEventListener(starling.events.Event.TRIGGERED, nextClickHandler);
        prevButton.addEventListener(starling.events.Event.TRIGGERED, prevClickHandler);

        appModel.addEventListener(AppModel.PAGES_CHANGED, pagesChangedHandler);
        appModel.addEventListener(AppModel.CURRENT_PAGE_CHANGED, currentPageChangedHandler);

        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(e:starling.events.Event):void
    {
        stage.addEventListener(starling.events.KeyboardEvent.KEY_DOWN, keyboardDownHandler);
    }

    private function keyboardDownHandler(e:KeyboardEvent):void
    {
        switch (e.keyCode)
        {
            case 37 :   appModel.goToPrevPage();
                        break;

            case 39 :   appModel.goToNextPage();
                        break;
        }
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
        createListItems();
        createThumbnails();
    }

    private function currentPageChangedHandler(event:flash.events.Event):void
    {
        displayCurrentImage();
    }

    private function createListItems():void
    {
        listItems = new Vector.<ListItems>();
        var yPos:uint = 0;
        for each(var pageVO:PageVO in appModel.pages)
        {
            var listItem:ListItems = new ListItems(pageVO);
            listItem.addEventListener(starling.events.Event.COMPLETE, listItemSelectHandler);
            listItem.load();
            listItem.x = 0;
            listItem.y = yPos;
            addChild(listItem);
            listItems.push(listItem);
            yPos += 20;
        }
        displayCurrentImage();
    }

    private function listItemSelectHandler(e:starling.events.Event):void
    {
        var selectedListItem = (e.target as ListItems).pageVO;
        appModel.currentPage = selectedListItem;
    }

    private function createThumbnails():void
    {
        thumbnailContainer.removeChildren();
        thumbnails = new Vector.<Thumbnail>();
        var xPos:uint = 0;
        for each(var pageVO:PageVO in appModel.pages)
        {
            var thumbnail:Thumbnail = new Thumbnail(pageVO, 100, 100);
            thumbnail.addEventListener(starling.events.Event.COMPLETE, thumbnailSelectHandler);
            thumbnail.load();
            thumbnail.x = xPos;
            thumbnailContainer.addChild(thumbnail);
            thumbnails.push(thumbnail);
            xPos += 110;
        }
        displayCurrentImage();
    }

    private function thumbnailSelectHandler(e:starling.events.Event):void
    {
        appModel.currentPage = (e.target as Thumbnail).pageVO;
    }

    private function displayCurrentImage():void
    {
        var activeThumbnail:Thumbnail;
        for each(var thumbnail:Thumbnail in thumbnails)
        {
            thumbnail.selected = (thumbnail.pageVO == appModel.currentPage);

            if(thumbnail.selected)
            {
                activeThumbnail = thumbnail;
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

        var index:int = thumbnails.indexOf(activeThumbnail);
        if(index == 0) index = 1;
        if(index == thumbnails.length - 1) index = thumbnails.length - 2;
        var targetX:Number = -index*thumbnailWidth + thumbnailWidth - (index-1) * thumbnailMargin;
        TweenLite.to(thumbnailContainer, .3, {x: targetX});

        var activeListItem:ListItems;
        for each(var listItem:ListItems in listItems)
        {
            listItem.selected = (listItem.pageVO == appModel.currentPage);
            if(listItem.selected)
            {
                activeListItem = listItem;
            }
        }
    }
}
}