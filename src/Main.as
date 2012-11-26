package {

import be.devine.cp3.iBook1.Application;

import flash.display.Screen;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

[SWF(frameRate=60)]
public class Main extends Sprite {

    private var app:Application;

    public function Main()
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.nativeWindow.visible = true;
        stage.nativeWindow.width = 800;
        stage.nativeWindow.height = 600;
        stage.nativeWindow.x = (Screen.mainScreen.bounds.width - 800) * .5;
        stage.nativeWindow.y = (Screen.mainScreen.bounds.height - 600) * .5;
        stage.nativeWindow.title = "Magazine";

        app = new Application();
        app.setSize(800, 600);
        addChild(app);

        trace('test');

        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:Event):void
    {
        app.setSize(stage.stageWidth, stage.stageHeight);
    }
}
}
