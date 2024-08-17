package {
  import flash.external.ExternalInterface;
  import flash.display.Sprite;
  import flash.events.MouseEvent;
  import flash.text.TextField;

  import components.Button;

  public class Main extends Sprite {
    private var close:Button;
    private var buttons:Array = [];

    private var settings:Button;
    private var store:Button;
    private var mods:Button;
    private var exit:Button;

    public function Main() {
      super();

      renderer.rectangle(this, curvu.X-1, curvu.Y-1, curvu.W+2, curvu.H+2, renderer.BORDER);
      renderer.rectangle(this, curvu.X, curvu.Y, curvu.W, curvu.H, renderer.MAIN);

      this.close = new Button("CLOSE", curvu.W-48, 0, 50, 25, renderer.RED, 9, false);
      this.close.addEventListener(MouseEvent.CLICK, this.onClose);
      this.addChild(this.close);

      this.buttons.push((settings = new Button("$EscapeMenu_Settings", curvu.X+40, 46, curvu.W-80, 40, renderer.BUTTON_COLOR)));
      this.buttons.push((store = new Button("$EscapeMenu_Store", curvu.X+40, 106, curvu.W-80, 40, renderer.BUTTON_COLOR)));
      this.buttons.push((mods = new Button("$EscapeMenu_ModLoader", curvu.X+40, 166, curvu.W-80, 40, renderer.BUTTON_COLOR)));
      this.buttons.push((exit = new Button("$EscapeMenu_Exit", curvu.X+40, 224, curvu.W-80, 40, renderer.RED)));

      settings.addEventListener(MouseEvent.CLICK, this.onSettings);
      store.addEventListener(MouseEvent.CLICK, this.onStore);
      mods.addEventListener(MouseEvent.CLICK, this.onMods);
      exit.addEventListener(MouseEvent.CLICK, this.onExit);

      for each (var button:Button in this.buttons)
        this.addChild(button);
    }

    private function onClose(e:MouseEvent) : * {
      ExternalInterface.call("OnRequestClose");
    }

    private function onStore(e:MouseEvent) : void {
      ExternalInterface.call("ON_BUTTON_CLICKED", curvu.STORE);
    }

    private function onSettings(e:MouseEvent) : void {
      ExternalInterface.call("ON_BUTTON_CLICKED", curvu.SETTINGS);
    }

    private function onMods(e:MouseEvent) : void {
      ExternalInterface.call("ON_BUTTON_CLICKED", curvu.MODS);
    }

    private function onExit(e:MouseEvent) : void {
      ExternalInterface.call("ON_BUTTON_CLICKED", curvu.EXIT);
    }
  }
}
