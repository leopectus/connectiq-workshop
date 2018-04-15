using Toybox.WatchUi as Ui;

class RoutingDelegate extends Ui.BehaviorDelegate {

	var controller;

    function initialize() {
        BehaviorDelegate.initialize();
        controller = Application.getApp().controller;
    }
    
    function onNextPage() {
    	controller.routingIndexInc();    	
    }
    
    function onPreviousPage() {    	
    	controller.routingIndexDec();
    }

    function onSelect() {
   		controller.startMapImage();
    }

}