using Toybox.WatchUi as Ui;

class GeocodingDelegate extends Ui.BehaviorDelegate {
	
	var controller;

    function initialize() {
        BehaviorDelegate.initialize();
        controller = Application.getApp().controller;
    }

    function onSelect() {
        controller.onStart();        
        return true;
    }    

}