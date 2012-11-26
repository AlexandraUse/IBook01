package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;

import flash.display.Sprite;

public class Application extends Sprite
{
    private var appModel;

    public function Application()
    {
        appModel = new AppModel();
    }

    public function setSize(w:uint,  h:uint):void
    {

    }
}
}
