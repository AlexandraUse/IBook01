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
        addChild(image);
    }
}
}
