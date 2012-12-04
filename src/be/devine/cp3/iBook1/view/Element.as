/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 4/12/12
 * Time: 14:16
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.view {
import be.devine.cp3.iBook1.vo.ElementVO;

import starling.display.Sprite;

public class Element extends Sprite
{
    protected var _elementVO:ElementVO;

    public function Element(elementVO:ElementVO)
    {
        _elementVO = elementVO;
    }
}
}
