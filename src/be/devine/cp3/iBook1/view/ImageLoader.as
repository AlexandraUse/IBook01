package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.vo.ImageVo;
import be.devine.cp3.iBook1.vo.PageVO;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class ImageLoader extends starling.display.Sprite
{
    private var ldr:Loader;
    private var image:Image;

    public function ImageLoader()
    {
        ldr = new Loader();
        ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, photoCompleteHandler);
    }

    public function load(url:String)
    {
        ldr.load(new URLRequest(url));
    }

    private function photoCompleteHandler(event:Event):void
    {
        if(image)
        {
            removeChild(image);
        }

        var texture:Texture = Texture.fromBitmap(ldr.content as Bitmap);
        image = new Image(texture);
        image.y = 30;
        image.x = 35;
        addChild(image);
    }
}
}
