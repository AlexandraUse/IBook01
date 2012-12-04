package be.devine.cp3.iBook1.view
{
import starling.display.Button;
import starling.textures.Texture;
import starling.display.Sprite;

public class PrevButton extends Sprite
{
    [Embed(source="/../libs/previousButton.png")]
    public static const PrevButtonImage:Class;

    public function PrevButton()
    {
        var prevButton = new Button(Texture.fromBitmap(new PrevButtonImage()));
        addChild(prevButton);
    }
}
}
