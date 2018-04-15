using Toybox.WatchUi as Ui;

class GeocodingView extends Ui.View {
	
	var controller;
	var label;
	
    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;
        label = null;        
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        label = View.findDrawableById("id_locationlabel");
    }

    function onShow() {
    }
    
    function onUpdate(dc) {        
        var labelText = controller.getAddressText();
        label.setText(labelText);
        View.onUpdate(dc);
    }

    function onHide() {
    }
}