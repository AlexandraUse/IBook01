package be.devine.cp3.iBook1.vo
{
import be.devine.cp3.iBook1.factory.view.ElementFactory;

public class PageVO extends ElementFactory
{

    public var elements:Vector.<ElementVO>;

    public function PageVO()
    {
        elements = new Vector.<ElementVO>();
    }
}
}
