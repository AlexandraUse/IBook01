package be.devine.cp3.iBook1.queue.tasks
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    public class XMLParser extends URLLoader implements IQueueTask
    {
        //Properties
        public static var XML_LOADED:String = 'xml loaded';
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
            addEventListener(Event.COMPLETE, completeXmlHandler);
            load(new URLRequest(_url));
        }

        private function completeXmlHandler(event:Event):void
        {
            data = new XML(event.currentTarget.data);
            dispatchEvent(new Event(XML_LOADED));
        }
    }
}
