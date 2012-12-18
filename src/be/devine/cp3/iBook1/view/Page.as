package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.factory.view.ElementFactory;
import be.devine.cp3.iBook1.vo.ElementVO;
import be.devine.cp3.iBook1.vo.PageVO;

import starling.display.Sprite;

public class Page extends starling.display.Sprite
{
    private var pageVO:PageVO;

    public function Page(pageVO:PageVO)
    {
        this.pageVO = pageVO;
        for each(var elementVO:ElementVO in pageVO.elements)
        {
            var element:Element = ElementFactory.createFromVO(elementVO);
            addChild(element);
        }
    }
}
}