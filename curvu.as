package {
  public class curvu {
    public static const W:int = 384;
    public static const H:int = 283;
    public static const X:int = 1;
    public static const Y:int = 1;

    public static const STORE:int = 1;
    public static const SETTINGS:int = 2;
    public static const EXIT:int = 3;
    public static const MODS:int = 4;

    public static function darken(color:uint, amount:Number) : uint {
      var r:uint = (color >> 16) & 0xFF;
      var g:uint = (color >> 8) & 0xFF;
      var b:uint = color & 0xFF;
      return ((r * amount) << 16) | ((g * amount) << 8) | (b * amount);
    }
  }
}