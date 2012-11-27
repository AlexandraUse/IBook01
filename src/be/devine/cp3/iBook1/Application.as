package be.devine.cp3.iBook1
{
import be.devine.cp3.iBook1.model.AppModel;
import be.devine.cp3.iBook1.vo.PageVO;

import flash.events.Event;

import starling.display.Sprite;


public class Application extends Sprite
{
    private var appModel:AppModel;
    private var pages:Vector.<PageVO>;

    public function Application()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(flash.events.Event.COMPLETE, appModelCompleteHandler);
        appModel.addEventListener(flash.events.Event.CHANGE, appModelChangeHandler);
        appModel.load();
    }

    private function appModelChangeHandler(event:flash.events.Event):void
    {
        //display();
    }

    private function appModelCompleteHandler(event:flash.events.Event):void
    {
        pages = new Vector.<PageVO>();
        trace('MakePage');
        /*for each(var page:PageVo in appModel.pages)
        {
            var text:PageVo = new PageVo(Texture.fromBitmap(bmp));
            img.scaleWhenDown = 1;
            img.addEventListener(starling.events.Event.TRIGGERED, imgTriggeredHandler);
            addChild(img);
            pages.push(img);
        }*/
        //display();
    }

    /*private function display():void
    {
        if(images)
        {
            var i:int;
            var img:Button;
            for each(img in images) {
                Starling.juggler.removeTweens(img);
            }

            //get the image to show in center of the screen
            var centeredImage:Button = images[appModel.currentImageIndex];
            var targetX:Number = (stage.stageWidth - centeredImage.width) * .5;
            var targetY:Number = (stage.stageHeight - centeredImage.height) * .5;
            var centeredImageTargetX:Number = targetX;
            var t:Tween;

            /*if(hasDoneInitialLayout) {
                t = new Tween(centeredImage, .5);
                //t.transition = Transitions.EASE_OUT;
                t.animate("x", targetX);
                t.animate("y", targetY);
                Starling.juggler.add(t);
            } else {
                centeredImage.x = targetX;
                centeredImage.y = targetY;
            }

            var xPos:Number = centeredImageTargetX;
            for(i = appModel.currentImageIndex-1; i > -1; i--) {
                img = images[i];
                xPos -= img.width;
                targetX = xPos;
                targetY = (stage.stageHeight - img.height) * .5;

                if(hasDoneInitialLayout) {
                    t = new Tween(img, .5);
                    //t.transition = Transitions.EASE_OUT;
                    t.animate("x", targetX);
                    t.animate("y", targetY);
                    Starling.juggler.add(t);
                } else {
                    img.x = targetX;
                    img.y = targetY;
                }
            }
            xPos = centeredImageTargetX + centeredImage.width;
            for(i = appModel.currentImageIndex+1; i < images.length; i++) {
                img = images[i];
                targetX = xPos;
                targetY = (stage.stageHeight - img.height) * .5;

                if(hasDoneInitialLayout) {
                    t = new Tween(img, .5);
                    //t.transition = Transitions.EASE_OUT;
                    t.animate("x", targetX);
                    t.animate("y", targetY);
                    Starling.juggler.add(t);
                } else {
                    img.x = targetX;
                    img.y = targetY;
                }

                xPos += img.width;
            }
            hasDoneInitialLayout = true;
        }
    }*/
}
}
