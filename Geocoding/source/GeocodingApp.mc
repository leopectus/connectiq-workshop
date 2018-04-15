using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class GeocodingApp extends App.AppBase {
	
	var model;
	var controller;

    function initialize() {
        AppBase.initialize();
        model = new GeocodingModel();
        controller = new GeocodingController();
    }
    
    function onStart(state) {
    }
    
    function onStop(state) {
    }
    
    function getInitialView() {
        return [ new GeocodingView(), new GeocodingDelegate() ];
    }

}