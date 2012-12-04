/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 4/12/12
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.factory.vo {
import be.devine.cp3.iBook1.vo.ElementVO;
import be.devine.cp3.iBook1.vo.ImageVO;
import be.devine.cp3.iBook1.vo.TextVO;

public class ElementVOFactory {

    public static function createFromXML(elementXML:XML):ElementVO
    {
        switch("" + elementXML.@type)
        {
            case "image": return createImageVO(elementXML);
            case "text": return createTextVO(elementXML);
            case "title": return createTitleVO(elementXML);
        }
        return null;
    }

    public static function createImageVO(elementXML:XML):ImageVO
    {
        var elementVO:ImageVO = new ImageVO();
        elementVO.path = elementXML.@path;
        return elementVO;
    }

    public static function createTextVO(elementXML:XML):TextVO
    {
        var elementVO:TextVO = new TextVO();
        elementVO.text = elementXML;
        return elementVO;
    }

    public static function createTitleVO(elementXML:XML):TextVO
    {
        var elementVO:TextVO = new TextVO();
        elementVO.title = elementXML;
        return elementVO;
    }
}
}
