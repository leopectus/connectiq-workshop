using Toybox.WatchUi as Ui;

class PositioningView extends Ui.View {
	
	var controller;
	var label;
	var timer;

    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;
        label = null;
        timer = new Timer.Timer();
    }    
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        label = View.findDrawableById("id_locationlabel");
    }

    function onShow() {
    	timer.start(method(:onTimer), 1000, true);
    }
    
    function onUpdate(dc) {    
        var labelText = controller.getLocationText();
        label.setText(labelText);
        View.onUpdate(dc);
    }

    function onHide() {
    }
    
    function onTimer() {
    	Ui.requestUpdate();
    }

}