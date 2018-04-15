class SightseeingController {
	
	var model;	
	
	function initialize() {
		model = Application.getApp().model;		
	}
	
	function getPositionString() {
		return model.getPositionString();
	}
	
	function getGpsAccuracy() {
		return model.getGpsAccuracy();
	}
	
	function getSightText() {
		return model.getSightText();
	}	
	
	function getInstructionText() {
		return model.getInstructionText();
	}
	
	function getMapImage() {
		return model.getMapImage();
	}
	
	function sightIndexInc() {
		model.sightIndexInc();
		WatchUi.requestUpdate();		
	}
	
	function sightIndexDec() {
		model.sightIndexDec();
		WatchUi.requestUpdate();
	}
	
	function routingIndexInc() {
		model.routingIndexInc();
		WatchUi.requestUpdate();
	}
	
	function routingIndexDec() {
		model.routingIndexDec();
		WatchUi.requestUpdate();
	}
	
	function startPlacesSearch() {
		model.makePlacesWebRequest();		
		WatchUi.pushView(new PlacesView(), new PlacesDelegate(), WatchUi.SLIDE_RIGHT);		
	}
	
	function startRouting() {
		model.makeRoutingWebRequest();
		WatchUi.pushView(new RoutingView(), new RoutingDelegate(), WatchUi.SLIDE_RIGHT);		
	}	
	
	function startMapImage() {
		model.makeMapImageRequest();
		WatchUi.pushView(new MapImageView(), new MapImageDelegate(), WatchUi.SLIDE_RIGHT);
	}
}