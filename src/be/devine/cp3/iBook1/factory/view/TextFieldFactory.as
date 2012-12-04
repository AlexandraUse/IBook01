package be.devine.cp3.iBook1.factory.view {
import starling.text.TextField;
import starling.utils.Color;

public class TextFieldFactory
{
    public static function createTextField(object:String):TextField
    {

        var t:TextField = new TextField(180, 20, object, "Arial Narrow", 14, Color.GRAY);
        /*t.selectable = false;
        //values set by config object
        if(config.defaultTextFormat != null)
            t.defaultTextFormat = config.defaultTextFormat;
        if(config.embedFonts != null)
            t.embedFonts = config.embedFonts;
        if(config.text != null)
            t.text = config.text;
        if(config.multiline != null)
            t.multiline = config.multiline;
        if(config.wordWrap != null)
            t.wordWrap = config.wordWrap;
        if(config.autoSize != null)
            t.autoSize = config.autoSize;
        if(config.selectable != null)
            t.selectable = config.selectable;
        if(config.width != null)
            t.width = config.width;
        if(config.height != null)
            t.height = config.height;
        if(config.x != null)
            t.x = config.x;
        if(config.y != null)
            t.y = config.y;*/
        return t;

    }
}
}
