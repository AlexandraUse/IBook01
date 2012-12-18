/**
 * Created with IntelliJ IDEA.
 * User: Lexii
 * Date: 18/12/12
 * Time: 10:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.iBook1.view 
{
import be.devine.cp3.iBook1.factory.view.TextFieldFactory;
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.TextVO;

import starling.text.TextField;
import starling.utils.Color;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ListLoader extends Element
{
    private var listTextField:starling.text.TextField;
    private var _listItem:Boolean = false;
    private var _textVO:TextVO;

    public function ListLoader(textVO:TextVO)
    {
        super(textVO);
        this._textVO = textVO;

        listTextField = TextFieldFactory.createTextField({
            width: 180,
            height: 20,
            text: textVO.title,
            fontSize:14,
            hAlign: HAlign.LEFT,
            vAlign: VAlign.BOTTOM,
            color: Color.GRAY,
            x: 35,
            y: 205
        });
        addChild(listTextField);
    }

    public function get listItem():Boolean
    {
        return _listItem;
    }

    public function set listItem(value:Boolean):void
    {
        _listItem = value;
        if(value == true)
        {
            listTextField.color = Color.BLACK;
        }
        else
        {
            listTextField.color = Color.GRAY;
        }
    }
}
}
