package be.devine.cp3.iBook1.view
{
import flash.display.DisplayObject;
import flash.display.Sprite;

public class IconButton extends Sprite
{
    protected var icon:DisplayObject;

    public var explicitWidth:uint;
    public var explicitHeight:uint;

    public function IconButton(explicitWidth:uint, explicitHeight:uint)
    {
        this.explicitWidth = explicitWidth;
        this.explicitHeight = explicitHeight;

        graphics.beginFill(0xff0000, 0);
        graphics.drawRect(0, 0, explicitWidth, explicitHeight);
        graphics.endFill();

        createIcon();

        if(icon)
        {
            icon.x = Math.round((explicitWidth - icon.width) * .5);
            icon.y = Math.round((explicitHeight - icon.height) * .5);
            addChild(icon);
        }

        mouseChildren = false;
        buttonMode = true;
    }

    protected function createIcon():void
    {

    }
}
}
