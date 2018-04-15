using Toybox.WatchUi as Ui;

class GeocodingController
{	
	var model;
	var running;
	
	function initialize()
	{
		model = Application.getApp().model;
		running = false;
	}
	
	function getAddressText() {
		return model.getAddressText();		
	}
	
	function onStart()	{
		model.makeGeocoderWebRequest();
		Ui.requestUpdate();
	}	
}