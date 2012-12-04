/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 3/12/12
 * Time: 20:18
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.factory.vo {
import be.devine.cp3.iBook1.vo.PageVO;

public class PageVOFactory {
    public static function createFromXML(pageXML:XML):PageVO
    {
        var pageVO:PageVO = new PageVO();
        for each(var elementXML:XML in pageXML.elements.element)
        {
            pageVO.elements.push(ElementVOFactory.createFromXML(elementXML));
        }
        return pageVO;
    }
}
}
