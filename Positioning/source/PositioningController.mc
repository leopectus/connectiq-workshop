using Toybox.WatchUi as Ui;

class PositioningController
{	
	var model;
	var running;
	
	function initialize()
	{
		model = Application.getApp().model;
		running = false;
	}
	
	function start() {
		model.enablePositioning();
		running = true;
	}
	
	function stop() {
		model.disablePositioning();
		running = false;
	}
	
	function getLocationText() {
		if (running) {
			return model.getLocationText();
		} 
		else {
			return "Press Start for GPS";
		}
	}
	
	function onStartStop()	{
	
		if (running) {
			stop();			
		}
		else {
			start();
		}
		Ui.requestUpdate();
	}	
}