package {
  import flash.filters.DropShadowFilter;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.geom.Matrix;
  import flash.display.GradientType;
  import flash.geom.ColorTransform;

  public class renderer {
    private static const TEXT_SHADOW:DropShadowFilter = new DropShadowFilter(1, 45, 0, 1, 0, 0, 1, 1);
    private static const TEXT_FORMAT_DEFAULT:TextFormat = new TextFormat("Open Sans", 12, WHITE, false);

    public static const FMT:TextFormat = new TextFormat("Open Sans", null, WHITE, null, false, false, null, null);
    public static const SHADOW:DropShadowFilter = new DropShadowFilter(1, 45, 0, 1, 0, 0, 1, 1);

    public static const RED:uint = 0xF25E74;
    public static const BUTTON_COLOR:int = 0x191919;
    public static const BORDER:int = 0x0C0C0C;
    public static const MAIN:int = 0x1E1E1E;
    public static const WHITE:uint = 0xFFFFFF;

    public function renderer() {
      super();
    }

    public static function hexToRGB(hex:uint):ColorTransform {
      var red:uint = (hex >> 16) & 0xFF;
      var green:uint = (hex >> 8) & 0xFF;
      var blue:uint = hex & 0xFF;

      return new ColorTransform(0, 0, 0, 1, red, green, blue, 0);
    }

    public static function rectangle(s:*, x:int = 0, y:int = 0, w:int = 0, h:int = 0, rgb:int = 0, a:Number = 1) : * {
      if(!s) return;
      s.graphics.beginFill(rgb,a);
      s.graphics.drawRect(x,y,w,h);
      s.graphics.endFill();
      return s;
    }

    public static function text(str:String = "", x:int = 0, y:int = 0, size:Number = 8, align:String = "left", w:int = -1, h:int = -1, isBold:Boolean = false, wordWrap:Boolean = false):TextField {
      var tf:TextField = new TextField();
      tf.filters = [SHADOW];
      FMT.size = size;
      FMT.align = align;
      FMT.bold = isBold;
      tf.defaultTextFormat = FMT;
      tf.mouseEnabled = false;
      tf.x = x;
      tf.y = y;
      tf.htmlText = str;
      if (w != -1) tf.width = w;
      if (h != -1) tf.height = h;
      tf.wordWrap = wordWrap;
      tf.autoSize = align;
      return tf;
    }
  }
}
