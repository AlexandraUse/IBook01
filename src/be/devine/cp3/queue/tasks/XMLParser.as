package be.devine.cp3.queue.tasks
{
import flash.display.Loader;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class XMLParser extends Loader implements IQueueTask
    {
        //Properties
        private var _url:String;
        private var _data:XML;

        //Constructor
        public function XMLParser(url:String)
        {
            this._url = url;
        }

        //Methods
        public function start():void
        {
            addEventListener(Event.COMPLETE, completeHandler);
            addEventListener(ProgressEvent.PROGRESS, progressHandler);
            load(new URLRequest(_url));
        }

        private function progressHandler(event:ProgressEvent):void
        {
            dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, event.bytesLoaded, event.bytesTotal));
        }

        private function completeHandler(event:Event):void
        {
            data = new XML(XML(event.currentTarget.data));
        }

        //Getters & Setters
        public function get data():XML
        {
            return _data;
        }

        public function set data(value:XML):void
        {
            _data = value;
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }
}
