package be.devine.cp3.iBook1.model
{
import be.devine.cp3.iBook1.vo.ImageVo;

import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher
{
    //private var _pages:Vector.<ImageVO>;
    private var _pages:Vector.<ImageVo>;
    private var pagesChanged:Boolean = false;

    //private var _currentPage:ImageVO;
    private var currentPageChanged:Boolean;

    public function AppModel()
    {

    }

    public function goToNextPage():void
    {

    }

    public function goToPrevPage():void
    {

    }
}
}
