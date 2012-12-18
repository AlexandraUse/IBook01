package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.factory.view.TextFieldFactory;
import be.devine.cp3.iBook1.vo.UrlVO;

import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class UrlLoader extends Element
{
    private var urlTextField:starling.text.TextField;

    public function UrlLoader(urlVO:UrlVO)
    {
        super(urlVO);

        urlTextField = TextFieldFactory.createTextField({
            width: 180,
            height: 20,
            text: urlVO.link,
            fontSize:14,
            hAlign: HAlign.LEFT,
            vAlign: VAlign.BOTTOM,
            color: Color.GRAY,
            x: 40,
            y: 242
        });
        addChild(urlTextField);
    }
}
}
