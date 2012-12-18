package be.devine.cp3.iBook1.view
{
import starling.display.Button;
import starling.display.Sprite;
import starling.textures.Texture;

public class NextButton extends Sprite
{
    [Embed(source="/../libs/nextButton.png")]
    public static const NextButtonImage:Class;

    public function NextButton()
    {
        var nextButton = new Button(Texture.fromBitmap(new NextButtonImage()));
        addChild(nextButton);
        nextButton.x = 545;
    }
}
}