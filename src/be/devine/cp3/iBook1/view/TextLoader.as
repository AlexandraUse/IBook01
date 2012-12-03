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
        titleTextField = new starling.text.TextField(100, 20, title, "Arial", 12, Color.RED);
        titleTextField.hAlign = HAlign.RIGHT;
        titleTextField.vAlign = VAlign.BOTTOM;
        addChild(titleTextField);
    }

    public function loadText(text:String)
    {
        textTextField= new starling.text.TextField(300, 300, text, "Arial", 12, Color.RED);
        //textTextField.hAlign = HAlign.RIGHT;
        //textTextField.vAlign = VAlign.BOTTOM;
        //addChild(textTextField);
    }
}
}
