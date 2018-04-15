using Toybox.WatchUi as Ui;

class PlacesView extends Ui.View {

	var controller;

	var sightsLabel;

    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;        
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.PlacesLayout(dc));
        sightsLabel = View.findDrawableById("id_sights");             
    }
    
    function onShow() {
    }
    
    function onUpdate(dc) {
    	sightsLabel.setText(controller.getSightText());
    	View.onUpdate(dc);    	
    }

    function onHide() {
    }

}