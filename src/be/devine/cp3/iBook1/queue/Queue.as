package be.devine.cp3.iBook1.queue
{
import be.devine.cp3.iBook1.queue.tasks.IQueueTask;
import be.devine.cp3.iBook1.queue.tasks.XMLParser;
import flash.events.Event;
import flash.events.EventDispatcher;

public class Queue extends EventDispatcher
{
		
    private var xml:Array;
    private var _xmlData:XML;

		
    public function Queue()
    {
        xml = [];
    }

    public function add(task:IQueueTask):void
    {
        xml.push(task);
    }

    public function start():void
    {
        load();
    }

    private function load():void
    {
        var task:IQueueTask = xml[0];
        task.addEventListener(XMLParser.XML_LOADED, itemCompleteHandler);
        task.start();
    }

    private function itemCompleteHandler(event:Event):void
    {
        xmlData = event.currentTarget.data;
    }

    public function get xmlData():XML
    {
        return _xmlData;
    }

    public function set xmlData(value:XML):void
    {
        if(_xmlData != value)
        {
            _xmlData = value;
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }
}
}