package be.devine.cp3.iBook1.view
{
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextLoader extends starling.display.Sprite
{
    private var titleTextField:starling.text.TextField;
    private var textTextField:starling.text.TextField;

    public function TextLoader()
    {

    }

    public function loadTitle(title:String)
    {
        if(titleTextField)
        {
            removeChild(titleTextField);
        }
        titleTextField = new starling.text.TextField(180, 20, title, "Arial Narrow", 14, Color.GRAY);
        titleTextField.hAlign = HAlign.LEFT;
        titleTextField.y = 212;
        titleTextField.x = 40;
        //titleTextField.vAlign = VAlign.BOTTOM;
        addChild(titleTextField);
    }

    public function loadText(text:String)
    {
        if(textTextField)
        {
            removeChild(textTextField);
        }

        textTextField= new starling.text.TextField(215, 360, text, "Arial Narrow", 12, Color.BLACK);
        textTextField.hAlign = HAlign.LEFT;
        textTextField.y = 45;
        textTextField.x = 230;
        textTextField.vAlign = VAlign.TOP;
        addChild(textTextField);
    }
}
}
