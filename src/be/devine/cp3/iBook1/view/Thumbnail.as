package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.factory.view.ElementFactory;
import be.devine.cp3.iBook1.vo.ElementVO;
import be.devine.cp3.iBook1.vo.ImageVO;
import be.devine.cp3.iBook1.vo.PageVO;

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.JointStyle;
import flash.display.Shape;

import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Thumbnail extends starling.display.Sprite
{
    private var _pageVO:PageVO;
    private var _selected:Boolean;
    private var image:ImageLoader;
    private var border:Shape;
    private var bmpShape:Image;

    private var w:uint;
    private var h:uint;


    public function Thumbnail(pageVO:PageVO, w:uint,  h:uint)
    {
        this._pageVO = pageVO;
        this.w = w;
        this.h = h;
        load();

        border = new Shape();
        addEventListener(TouchEvent.TOUCH, clickHandler);
    }

    public function load():void
    {
        for each(var elementVO:ElementVO in _pageVO.elements)
        {
            image = new ImageLoader(_pageVO.elements[2] as ImageVO);
            image.setMaxSize(w, h);
            image.thumbnails = true;
            addChild(image);
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
        if(bmpShape)
        {
            removeChild(bmpShape);
        }

        border.graphics.clear();
        if(_selected)
        {
            border.graphics.lineStyle(2, 0xff0000, 1, true);
            border.graphics.drawRect(1, 1, w-2, h-4);
            border.graphics.endFill();
            var bmpShapeData:BitmapData = new BitmapData(100, 100, true, 0);
            bmpShapeData.draw(border);
            bmpShape = Image.fromBitmap(new Bitmap(bmpShapeData, "auto", true));
            addChild(bmpShape);
        }
    }
}
}
