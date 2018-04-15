using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class MapImageApp extends App.AppBase {
	
	var model;
	var controller;

    function initialize() {
        AppBase.initialize();
        model = new MapImageModel();
        controller = new MapImageController();
    }
    
    function onStart(state) {
    }
    
    function onStop(state) {
    }
    
    function getInitialView() {
        return [ new MapImageView(), new MapImageDelegate() ];
    }

}