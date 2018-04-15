using Toybox.WatchUi as Ui;

class PositioningView extends Ui.View {

    function initialize() {
        View.initialize();
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.PositioningLayout(dc));
    }
    
    function onShow() {
    }
    
    function onUpdate(dc) {        
        View.onUpdate(dc);
    }

    function onHide() {
    }

}