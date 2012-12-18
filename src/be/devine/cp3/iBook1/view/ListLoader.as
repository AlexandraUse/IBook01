/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 18/12/12
 * Time: 10:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.view {
import be.devine.cp3.iBook1.factory.view.TextFieldFactory;
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.TextVO;

import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ListLoader extends Element
{
    private var appModel:AppModel;

    private var listTextField:starling.text.TextField;

    public var selectedListItem:Boolean = false;
    private var kleur:uint;

    private var _textVO:TextVO;

    public function ListLoader(textVO:TextVO)
    {
        super(textVO);

        this.appModel = AppModel.getInstance();
        this._textVO = textVO;

        if(selectedListItem == true)
        {
            kleur = Color.BLACK;
        }else if(selectedListItem == false)
        {
            kleur = Color.GRAY;
        }

        listTextField = TextFieldFactory.createTextField({
            width: 180,
            height: 20,
            text: textVO.title,
            fontSize:14,
            hAlign: HAlign.LEFT,
            vAlign: VAlign.BOTTOM,
            color: kleur,
            x: 40,
            y: 75
        });
        addChild(listTextField);
    }
}
}
