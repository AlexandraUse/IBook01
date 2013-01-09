package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.vo.ElementVO;

import starling.display.Sprite;

public class Element extends Sprite
{
    protected var _elementVO:ElementVO;

    public function Element(elementVO:ElementVO)
    {
        trace('ok');
        _elementVO = elementVO;
    }
}
}