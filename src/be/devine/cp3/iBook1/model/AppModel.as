package be.devine.cp3.iBook1.model
{
import be.devine.cp3.iBook1.vo.PageVO;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class AppModel extends EventDispatcher
{
    private static var instance:AppModel;

    public static function getInstance():AppModel
    {
        if(instance == null)
            instance = new AppModel(new Enforcer());
        return instance;
    }

    public static const PAGES_CHANGED:String = "pagesChanged";
    public static const CURRENT_PAGE_CHANGED:String = "currentPageChanged";

    private var _pages:Array;
    private var _currentPage:PageVO;

    private var currentPageChanged:Boolean;
    private var _currentPageIndex:int;

    public function AppModel(e:Enforcer)
    {
        if(e == null)
        {
            throw new Error("AppModel is a Singleton");
        }

        load();
    }

    public function load():void
    {
        var pagesXMLLoader:URLLoader = new URLLoader();
        pagesXMLLoader.addEventListener(Event.COMPLETE, pagesXMLLoaderCompleteHandler);
        pagesXMLLoader.load(new URLRequest("assets/xml/bands.xml"));
    }

    private function pagesXMLLoaderCompleteHandler(event:Event):void
    {
        var pagesXML:XML = new XML(event.target.data);
        var pages:Array = [];
        for each(var page:Object in pagesXML.page)
        {
            var pageVO:PageVO = new PageVO();
            pageVO.title = page.title;
            pageVO.image = page.image;
            pageVO.text = page.text;
            pages.push(pageVO);
        }
        this.pages = pages;
        this.currentPage = pages[0];

    }

    private function commitProperties():void
    {
    }

    public function goToNextPage():void
    {

    }

    public function goToPrevPage():void
    {

    }

    public function get pages():Array
    {
        return _pages;
    }
    public function set pages(value:Array):void
    {
        if(value != _pages)
        {
            _pages = value;
            dispatchEvent(new Event(PAGES_CHANGED));
        }
    }

    public function get currentPage():PageVO
    {
        return _currentPage;
    }

    public function set currentPage(value:PageVO):void
    {
        if(_currentPage != value)
        {
            currentPageChanged = true;
            _currentPage = value;
            commitProperties();
            dispatchEvent(new Event(CURRENT_PAGE_CHANGED));
        }
    }
}
}

internal class Enforcer{};
