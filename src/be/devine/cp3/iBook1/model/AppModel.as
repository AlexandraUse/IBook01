package be.devine.cp3.iBook1.model
{
import be.devine.cp3.iBook1.vo.PageVo;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.tasks.XMLParser;

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

    private var queue:Queue;
    private var _pages:Vector.<PageVo>;
    private var _currentPageIndex:int;

    public function AppModel(e:Enforcer)
    {
        if(e == null)
        {
            throw new Error("AppModel is a Singleton");
        }
        _pages = new Vector.<PageVo>();
    }

    public function load():void
    {
        queue = new Queue();
        queue.add(new XMLParser("assets/xml/bands.xml"));
        queue.addEventListener(Event.COMPLETE, queueCompleteHandler);
        queue.start();
    }

    private function queueCompleteHandler(event:Event):void
    {

        trace('OK');
        /*for each(var task:LoaderTask in queue.finishedTasks) {
            _images.push(task.content as Bitmap);
        }
        dispatchEvent(new Event(Event.COMPLETE));*/
    }

    public function goToNextPage():void
    {

    }

    public function goToPrevPage():void
    {

    }
}
}

internal class Enforcer{};
