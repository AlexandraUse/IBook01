package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.ElementVO;
import be.devine.cp3.iBook1.vo.PageVO;
import be.devine.cp3.iBook1.vo.TextVO;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ListItems extends starling.display.Sprite
{
    private var _pageVO:PageVO;
    private var _selected:Boolean;
    private var listItem:ListLoader;

    public function ListItems(pageVO:PageVO)
    {
        this._pageVO = pageVO;
        this.useHandCursor = true;
        load();
        this.addEventListener(TouchEvent.TOUCH, clickHandler);
    }

    public function load():void
    {
        for each(var elementVO:ElementVO in _pageVO.elements)
        {
            listItem = new ListLoader(_pageVO.elements[0] as TextVO);
            listItem.y = -187;
            listItem.x = - 20;
            addChild(listItem);
        }
    }

    private function clickHandler(e:TouchEvent):void
    {
        var touches:Vector.<Touch> = e.getTouches(this,TouchPhase.ENDED);
        if(touches.length == 0) return;
        this.selected = true;
    }

    public function get selected():Boolean
    {
        return _selected;
    }

    public function set selected(value:Boolean):void
    {
        if(_selected != value)
        {
            _selected = value;
            display();
            if(_selected)
            {
                addEventListener(TouchEvent.TOUCH, clickHandler);
                dispatchEvent(new starling.events.Event(starling.events.Event.COMPLETE));
            }
        }
    }

    public function get pageVO():PageVO {
        return _pageVO;
    }

    public function set pageVO(value:PageVO):void {
        _pageVO = value;
    }

    private function display():void
    {
        listItem.listItem = false;
        if(_selected)
        {
            listItem.listItem = true;
        }

    }
}
}
