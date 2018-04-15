using Toybox.WatchUi as Ui;

class MapImageController
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
	
	function getMapImage() {
		var temp = model.getMapImage(); 
		return temp;
	}
	
	function onStart()	{
		model.makeMapImageRequest();
		Ui.requestUpdate();
	}	
}