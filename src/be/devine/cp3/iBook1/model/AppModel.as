package be.devine.cp3.iBook1.model
{
import be.devine.cp3.iBook1.vo.PageVO;

import flash.events.Event;
import flash.events.EventDispatcher;

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

        _pages = [];
    }

    private function commitProperties():void
    {
    }

    public function goToNextPage():void
    {
        var index:int = _pages.indexOf(_currentPage);
        if(index > -1)
        {
            index++;
            if(index < _pages.length) currentPage = _pages[index];
            else currentPage = _pages[0];
        }
    }

    public function goToPrevPage():void
    {
        var index:int = _pages.indexOf(_currentPage);
        if(index > -1)
        {
            index--;
            if(index > -1) currentPage = _pages[index];
            else currentPage = _pages[_pages.length - 1];
        }

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
