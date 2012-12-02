package be.devine.cp3.iBook1.view
{
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextLoader extends starling.display.Sprite
{
    public function TextLoader()
    {

    }

    public function loadTitle(title:String)
    {
        var starlingTextField:starling.text.TextField =
                new starling.text.TextField(
                        100, 20, title, "Arial", 12, Color.RED
                );
        //posities moeten nog gefixed worden!!
        starlingTextField.hAlign = HAlign.RIGHT;
        starlingTextField.vAlign = VAlign.BOTTOM;
        addChild(starlingTextField);
    }

    public function loadText(text:String)
    {

    }
}
}
