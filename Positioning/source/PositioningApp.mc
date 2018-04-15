using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class PositioningApp extends App.AppBase {
	
	var model;
	var controller;

    function initialize() {
        AppBase.initialize();
        model = new PositioningModel();
        controller = new PositioningController();
    }
 
    function onStart(state) {
    }
    
    function onStop(state) {
    }
    
    function getInitialView() {
        return [ new PositioningView(), new PositioningDelegate() ];
    }

}