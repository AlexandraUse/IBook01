/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 3/12/12
 * Time: 20:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.service {
import be.devine.cp3.iBook1.factory.vo.PageVOFactory;
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.PageVO;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class PageService extends EventDispatcher{

    public var pages:Array;

    public function PageService()
    {

    }

    public function load():void
    {
        var pagesXMLLoader:URLLoader = new URLLoader();
        pagesXMLLoader.addEventListener(Event.COMPLETE, pagesXMLLoaderCompleteHandler);
        pagesXMLLoader.load(new URLRequest("/assets/xml/bands.xml"));
    }

    private function pagesXMLLoaderCompleteHandler(event:Event):void
    {
        var contentXML:XML = new XML(event.target.data);
        var pages:Array = [];
        for each(var pageXML:XML in contentXML.page)
        {
            pages.push(PageVOFactory.createFromXML(pageXML));
        }
        this.pages = pages;
        dispatchEvent(new Event(Event.COMPLETE));

    }
}
}
