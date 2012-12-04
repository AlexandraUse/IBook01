package be.devine.cp3.iBook1.vo
{
public class PageVO
{
    public var text:String;
    public var title:String;
    public var image:String;

    public var pageImages:Vector.<ImageVo>;
    public var pageTexts:Vector.<TextVo>;
    public var pageUrls:Vector.<UrlVo>;

    public var pageElements:Array;

    public function PageVO()
    {
        pageElements = new Array(pageImages, pageTexts, pageUrls);
    }
}
}
