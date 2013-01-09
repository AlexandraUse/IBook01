package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.factory.view.TextFieldFactory;
import be.devine.cp3.iBook1.vo.UrlVO;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class UrlLoader extends Element
{
    private var urlTextField:starling.text.TextField;
    private var url:*;

    public function UrlLoader(urlVO:UrlVO)
    {
        super(urlVO);
        url = urlVO;
        this.useHandCursor = true;

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
        urlTextField.addEventListener(starling.events.TouchEvent.TOUCH, clickHandler);
    }

    private function clickHandler(e:starling.events.TouchEvent)
    {

        var touches:Vector.<Touch> = e.getTouches(this,TouchPhase.ENDED);
        if(touches.length == 0) return;
        var url:String = url.link
        var request:URLRequest = new URLRequest(url);
        try {
            navigateToURL(request, '_blank');
        } catch (e:Error) {
            trace("Error occurred!");
        }
    }
}
}
