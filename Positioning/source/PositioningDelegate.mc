using Toybox.WatchUi as Ui;

class PositioningDelegate extends Ui.BehaviorDelegate {
	
	var controller;

    function initialize() {
        BehaviorDelegate.initialize();
        controller = Application.getApp().controller;
    }

    function onSelect() {
        controller.onStartStop();        
        return true;
    }    

}