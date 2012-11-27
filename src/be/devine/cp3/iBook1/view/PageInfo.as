package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.model.AppModel;

import flash.display.Sprite;

import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;


public class PageInfo extends Sprite
{
    private var appModel:AppModel;

    private var title:TextField;
    private var text:TextField;

    public function PageInfo()
    {
        this.appModel = AppModel.getInstance();

        title = new TextField();
        title.autoSize = TextFieldAutoSize.LEFT;
        title.defaultTextFormat = new TextFormat("Arial", 11, 0xacb098);
        title.multiline = false;
        title.selectable = false;
        title.embedFonts = true;
        title.y = 5;
        title.x = 10;
        addChild(title);

        text = new TextField();
        text.autoSize = TextFieldAutoSize.LEFT;
        text.defaultTextFormat = new TextFormat("Arial", 11, 0xacb098);
        text.multiline = false;
        text.selectable = false;
        text.embedFonts = true;
        text.y = title.height + 20;
        text.x = 10;
        addChild(text);
    }
}
}
