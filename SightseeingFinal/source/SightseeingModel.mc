class SightseeingModel {

	// positioning variables
	var lat;
	var long;
	var accuracy;
	
	// places API variables
	var placesUrl;
	var placesParameters;
	var placesOptions;
	var sightsList;
	var sightText;
	var sightIndex;
	
	// routing API variables
	var routingUrl;
	var routingParameters;
	var routingOptions;
	var destinationWaypoint;
	var maneuvers;	
	var maneuverIndex;
	var instructionText;
	
	// map image API variables
	var mapImageUrl;
	var mapImageParameters;
	var mapImageOptions;
	var mapImage;
	
	function initialize() {
		sightText = "Waiting\n for response..."; 
		sightIndex = 0;
		sightsList = [];
				
		instructionText = "Waiting\n for response...";
		maneuverIndex = 0;
		maneuvers = [];
	}	
	
	function enablePositioning() {
		Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
	}
	
	function disablePositioning() {
		Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
	}
	
	function onPosition(info) {
		lat = info.position.toDegrees()[0];
		long = info.position.toDegrees()[1];
		accuracy = info.accuracy;		
		//System.println(lat + "," + long);
	}
	
	function makePlacesWebRequest() {
	
		placesUrl = "https://places.api.here.com/places/v1/discover/explore";
		
		placesParameters = {
			"app_id" => WatchUi.loadResource(Rez.Strings.app_id),
			"app_code" => WatchUi.loadResource(Rez.Strings.app_code),
			"at" => lat + "," + long,
			"cat" => "sights-museums",
			"size" => "5"
		};
		
		placesOptions = {
			:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
		};
		
		Communications.makeWebRequest(placesUrl, placesParameters, placesOptions, method(:onPlacesReceive));		
		
	}
	
	function onPlacesReceive(responseCode, data) {
		if (responseCode == 200) {
			
			var results = data.get("results");
	    	var items = results.get("items");
	    	sightsList = items;
	    	
	    	setPlacesInfo();	    	
	    		    	
	    	WatchUi.requestUpdate();
			
		} else {
			sightText = "Error: " + responseCode;
			//System.println(responseCode);
		}
	}
	
	function setPlacesInfo() {
		if (sightsList.size() > 0) {
   			var place = sightsList[sightIndex];   			
    		
    		var title = place.get("title");
    		var distance = place.get("distance");
    		var category = place.get("category");
    		var categoryTitle = category.get("title");
    		
    		var position = place.get("position");    		
    		destinationWaypoint = position[0] + "," + position[1];
    		
    		sightText = title + "\n" + categoryTitle + "\n" + "in " + distance + "m";
    		
    	} else {
    	  sightText = "No results found.";
    	}
	}
	
	function makeRoutingWebRequest() {
	
		routingUrl = "https://route.api.here.com/routing/7.2/calculateroute.json";
    	
    	routingParameters = {
    		"app_id" => WatchUi.loadResource(Rez.Strings.app_id),
		    "app_code" => WatchUi.loadResource(Rez.Strings.app_code),		    
		    "waypoint0" => lat + "," + long,
		    "waypoint1" => destinationWaypoint,
		    "mode" => "shortest;pedestrian",		    
		    "routeAttributes" => "none,legs",		    
		    "instructionFormat" => "text"
		};
			
		routingOptions = {
			:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
		};
		
		Communications.makeWebRequest(routingUrl, routingParameters, routingOptions, method(:onRoutingReceive));		
		
	}
	
	function onRoutingReceive(responseCode, data) {
		if (responseCode == 200) {
		
			var response = data.get("response");
    		var route = response.get("route");
    		route = route[0];
    		var leg = route.get("leg"); 
    		leg = leg[0];  
    		maneuvers = leg.get("maneuver");  	
    					
			setRoutingInfo();			
				    	
	    	WatchUi.requestUpdate();
			
		} else {
			instructionText = "Error: " + responseCode;
		}
	}
	
	function setRoutingInfo() {	
		if (maneuvers.size() > 0) {
    		instructionText = maneuvers[maneuverIndex].get("instruction");    		
    	} else {
    	  sightText = "No maneuvers found.";
    	}		
	}
	
	function makeMapImageRequest() {
	
		mapImageUrl = "https://image.maps.api.here.com/mia/1.6/mapview";
		
		mapImageParameters = {
			"app_id" => WatchUi.loadResource(Rez.Strings.app_id),
		    "app_code" => WatchUi.loadResource(Rez.Strings.app_code),
		    "c" => lat + "," + long,		    
		    "h" => "240",
		    "w" => "240",
		    "z" => "14",
		    "f" => "4"	
		};
		
		mapImageOptions = {
			:dithering => Communications.IMAGE_DITHERING_FLOYD_STEINBERG
		};
		
		Communications.makeImageRequest(mapImageUrl, mapImageParameters, mapImageOptions, method(:onMapImageReceive));
	}
	
	function onMapImageReceive(responseCode, data) {
		if (responseCode == 200) {
			mapImage = data;
		} else {
			System.println(responseCode);
		}
		
		WatchUi.requestUpdate();
	}
	
	function getPositionString() {
		var positionString = lat + "," + long; 
		return positionString;
	}
	
	function getGpsAccuracy() {
		return accuracy;
	}
	
	function getSightText() {
		return sightText;
	}
	
	function getMapImage() {
		return mapImage;
	}
	
	function sightIndexInc() {
		if (sightIndex < sightsList.size()-1) {    		
    		sightIndex = sightIndex+1;
    	} else {    		
    		sightIndex = sightsList.size()-1;    		    		
    	}    
    	setPlacesInfo();
	}
	
	function sightIndexDec() {
		if (sightIndex > 0) {    			
    		sightIndex = sightIndex-1;    		
    	} else {    		
    		sightIndex = 0;    		
    	}
    	setPlacesInfo();    	
	}	
	
	function routingIndexInc() {
		if (maneuverIndex < maneuvers.size()-1) {    		
    		maneuverIndex = maneuverIndex+1;
    	} else {    		
    		maneuverIndex = maneuvers.size()-1;    		    		
    	}    
    	setRoutingInfo();
	}
	
	function routingIndexDec() {
		if (maneuverIndex > 0) {    			
    		maneuverIndex = maneuverIndex-1;    		
    	} else {    		
    		maneuverIndex = 0;    		
    	}
    	setRoutingInfo();    	
	}
	
	function getInstructionText() {
		return instructionText;
	}
}