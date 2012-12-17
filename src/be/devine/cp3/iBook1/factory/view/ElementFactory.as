/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 4/12/12
 * Time: 14:47
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.factory.view {
import be.devine.cp3.iBook1.view.Element;
import be.devine.cp3.iBook1.view.ImageLoader;
import be.devine.cp3.iBook1.view.TextLoader;
import be.devine.cp3.iBook1.view.UrlLoader;
import be.devine.cp3.iBook1.vo.ElementVO;
import be.devine.cp3.iBook1.vo.ImageVO;
import be.devine.cp3.iBook1.vo.TextVO;
import be.devine.cp3.iBook1.vo.UrlVO;

public class ElementFactory {

    public static function createFromVO(elementVO:ElementVO):Element
    {
        if(elementVO is ImageVO)
        {
            return new ImageLoader(elementVO as ImageVO);
        }
        if(elementVO is TextVO)
        {
            return new TextLoader(elementVO as TextVO);
        }

        if(elementVO is UrlVO)
        {
            return new UrlLoader(elementVO as UrlVO);
        }

        return new Element(elementVO);
    }
}
}
