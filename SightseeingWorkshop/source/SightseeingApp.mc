using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class SightseeingApp extends App.AppBase {

	var model;
	var controller;

    function initialize() {
        AppBase.initialize();
        model = new SightseeingModel();
        controller = new SightseeingController();
    }

    function onStart(state) {
    	// TODO: start positioning in model
    }

    function onStop(state) {
    	// TODO: stop positioning in model
    }

    function getInitialView() {
        return [ new PositioningView(), new PositioningDelegate() ];
    }

}