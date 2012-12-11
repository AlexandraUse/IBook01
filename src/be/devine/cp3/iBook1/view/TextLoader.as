package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.factory.view.TextFieldFactory;
import be.devine.cp3.iBook1.vo.TextVO;

import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class TextLoader extends Element
{
    private var titleTextField:starling.text.TextField;
    private var textTextField:starling.text.TextField;

    public function TextLoader(textVO:TextVO)
    {
        super(textVO);

        titleTextField = TextFieldFactory.createTextField({
            width: 180,
            height: 20,
            text: textVO.title,
            fontSize:14,
            hAlign: HAlign.LEFT,
            vAlign: VAlign.BOTTOM,
            color: Color.GRAY
        });
        titleTextField.y = 212;
        titleTextField.x = 40;
        addChild(titleTextField);

        textTextField = TextFieldFactory.createTextField({
            width: 215,
            height: 360,
            text: textVO.text,
            fontSize: 12,
            hAlign: HAlign.LEFT,
            vAlign: VAlign.TOP,
            color: Color.BLACK
        });
        textTextField.y = 45;
        textTextField.x = 230;
        addChild(textTextField);
    }
}
}
