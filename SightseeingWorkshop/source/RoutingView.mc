using Toybox.WatchUi as Ui;

class RoutingView extends Ui.View {

	var controller;

	var instructionsLabel;

    function initialize() {
        View.initialize();
        controller = Application.getApp().controller;        
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.RoutingLayout(dc));
        instructionsLabel = View.findDrawableById("id_instructions");             
    }
    
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	instructionsLabel.setText(controller.getInstructionText());
    	View.onUpdate(dc);    	
    }

    function onHide() {
    }

}