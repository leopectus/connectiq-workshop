using Toybox.WatchUi as Ui;

class PlacesDelegate extends Ui.BehaviorDelegate {

	var controller;

    function initialize() {
        BehaviorDelegate.initialize();
        controller = Application.getApp().controller;
    }
    
    function onNextPage() {
    	controller.sightIndexInc();    	
    }
    
    function onPreviousPage() {    	
    	controller.sightIndexDec();
    }

    function onSelect() {
   		controller.startRouting();
    }

}