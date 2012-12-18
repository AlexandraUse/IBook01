package be.devine.cp3.iBook1.factory.view
{
import flash.text.Font;
import starling.text.TextField;

public class TextFieldFactory
{
    [Embed(source="/assets/fonts/Helvetica.dfont", embedAsCFF="false", mimeType = "application/x-font", fontWeight="normal", fontStyle="normal", advancedAntiAliasing="false", fontName="Helvetica")]
    private static const Helvetica:Class;
    private static const helvetica:Font = new Helvetica();

    public static function createTextField(config:Object):TextField
    {
        var t:TextField = new TextField(config.width, config.height, config.text, helvetica.fontName, config.fontSize, config.vAlign, config.color);

        if(config.fontName != null)
            t.fontName = config.fontName;
        if(config.text != null)
            t.text = config.text;
        if(config.hAlign != null)
            t.hAlign = config.hAlign;
        if(config.vAlign != null)
            t.vAlign = config.vAlign;
        if(config.color != null)
            t.color = config.color;
        if(config.autoScale != null)
            t.autoScale = config.autoScale;
        if(config.width != null)
            t.width = config.width;
        if(config.height != null)
            t.height = config.height;
        if(config.x != null)
            t.x = config.x;
        if(config.y != null)
            t.y = config.y;

        return t;
    }
}
}
