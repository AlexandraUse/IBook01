package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.vo.ImageVO;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import starling.display.Image;

import starling.textures.Texture;

public class ImageLoader extends Element
{
    private var ldr:Loader;
    private var image:Image;
    private var _thumbnails:Boolean = false;

    private var _maxWidth:Number = 0;
    private var _maxHeight:Number = 0;

    public function ImageLoader(imageVO:ImageVO)
    {
        super(imageVO);

        ldr = new Loader();
        ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, photoCompleteHandler);
        ldr.load(new URLRequest(imageVO.path));
    }

    private function photoCompleteHandler(event:Event):void
    {
        var texture:Texture = Texture.fromBitmap(ldr.content as Bitmap);
        image = new Image(texture);
        image.y = 30;
        image.x = 35;
        if(_thumbnails)
        {
            display();
        }
        addChild(image);
    }

    private function display():void
    {
        if(image)
        {
            image.width = _maxWidth;
            image.scaleY = image.scaleX;
            if(image.height > _maxHeight)
            {
                image.height = _maxHeight;
                image.scaleX = image.scaleY;
            }

            image.width = Math.round(image.width);
            image.height = Math.round(image.height);

            image.x = Math.round((_maxWidth - image.width) * .5);
            image.y = Math.round((_maxHeight - image.height) *.5);
        }
    }

    public function setMaxSize(maxWidth:Number, maxHeight:Number):void
    {
        _maxWidth = maxWidth;
        _maxHeight = maxHeight;
        display();
    }

    public function get maxWidth():Number
    {
        return _maxWidth;
    }

    public function set maxWidth(value:Number):void
    {
        if(_maxWidth != value)
        {
            _maxWidth = value;
            display();
        }
    }

    public function get maxHeight():Number
    {
        return _maxHeight;
    }

    public function set maxHeight(value:Number):void
    {
        if(_maxHeight != value)
        {
            _maxHeight = value;
            display();
        }
    }

    public function get thumbnails():Boolean
    {
        return _thumbnails;
    }

    public function set thumbnails(value:Boolean):void
    {
        _thumbnails = value;
        if(value != _thumbnails)
        {
            display();
        }
    }
}
}
