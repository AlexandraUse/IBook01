package be.devine.cp3.iBook1.view
{
import be.devine.cp3.iBook1.model.AppModel;
import starling.display.Sprite;
import starling.events.Event;

public class PageSelector extends Sprite
{
    private var appModel:AppModel;

    private var arrowContainer:Sprite;
    private var nextButton:NextButton;
    private var prevButton:PrevButton;

    public function PageSelector()
    {
        this.appModel = AppModel.getInstance();

        nextButton = new NextButton();
        //addChild(nextButton);

        prevButton = new PrevButton();
        //addChild(prevButton);

        arrowContainer = new Sprite();
        arrowContainer.addChild(nextButton);
        arrowContainer.addChild(prevButton);
        arrowContainer.x = 205;
        arrowContainer.y = 205;
        addChild(arrowContainer);

        nextButton.addEventListener(Event.TRIGGERED, nextClickHandler);
        prevButton.addEventListener(Event.TRIGGERED, prevClickHandler);
    }

    private function nextClickHandler(e:Event):void
    {
        appModel.goToNextPage();
    }

    private function prevClickHandler(e:Event):void
    {
        appModel.goToPrevPage();
    }
}
}