package
{
import be.devine.cp3.iBook1.Application;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import starling.core.Starling;
import starling.events.ResizeEvent;

[SWF(frameRate=60, backgroundColor="0x555555")]
public class Main extends Sprite
{
    private var starling:Starling;

    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.nativeWindow.width = 800;
        stage.nativeWindow.height = 600;

        var rect:Rectangle = new Rectangle();
        rect.width = stage.stageWidth;
        rect.height = stage.stageHeight;

        starling = new Starling(Application, stage, rect);
        starling.start();

        stage.addEventListener(ResizeEvent.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:Event):void
    {
        var rect:Rectangle = new Rectangle();
        rect.width = stage.stageWidth;
        rect.height = stage.stageHeight;
        Starling.current.viewPort = rect;
    }
}
}