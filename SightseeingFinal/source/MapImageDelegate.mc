using Toybox.WatchUi as Ui;

class MapImageDelegate extends Ui.BehaviorDelegate {

	var controller;

    function initialize() {
        BehaviorDelegate.initialize();
        controller = Application.getApp().controller;
    }
}