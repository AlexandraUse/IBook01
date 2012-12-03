package be.devine.cp3.iBook1.view
{

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Button;

import starling.display.MovieClip;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class NextButton extends Sprite
{
    [Embed(source="/../libs/nextButton.png")]
    public static const NextButtonImage:Class;

    public function NextButton()
    {
        var nextButton = new Button(Texture.fromBitmap(new NextButtonImage()));
        addChild(nextButton);
        nextButton.x = 460;
        nextButton.y = 200;
    }
}
}
