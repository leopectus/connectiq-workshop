using Toybox.WatchUi as Ui;
using Toybox.Graphics;

class MapImageView extends Ui.View {
	
	var controller;
	var image;
	var message;
	
    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;
        message = "Press Start";
        image = null;        
    }
    
    function onLayout(dc) {        
    }

    function onShow() {    	
    }
    
    function onUpdate(dc) {
    	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_SMALL, message, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);        	        
        
        image = controller.getMapImage();
        if (image != null)
        {
        	dc.drawBitmap(15, 15, image);
        }
    }

    function onHide() {
    }
}