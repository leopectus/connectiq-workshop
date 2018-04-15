using Toybox.WatchUi as Ui;

class MapImageView extends Ui.View {

	var controller;

	var mapImage;

    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;        
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.MapLayout(dc));        
    }
    
    function onShow() {
    }
   
    function onUpdate(dc) {
    
    	View.onUpdate(dc);    	
    	
    	mapImage = controller.getMapImage();
        if (mapImage != null)
        {
        	dc.drawBitmap(0, 0, mapImage);
        }    	
    }

    function onHide() {
    }

}