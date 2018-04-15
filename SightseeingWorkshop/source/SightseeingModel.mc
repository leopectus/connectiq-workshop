class SightseeingModel {

	// TODO: create positioning variables
	

	// TODO: create Places API call variables	
	
	// TODO: create Places API result variables
	
	
	// TODO: create Routing API call variables
	
	// TODO: create Routing API result variables
	
	
	// TODO: create Map Image API call variables
	
	// TODO: Create Map Image API result variable
	
	
	function initialize() {
		
		//TODO: initialize Places API result variables
		
		//TODO: initialize Routing API result variables				
		
	}	
	
	//TODO: create function to enable positioning (enablePositioning)
	
	//TODO: create function to disable positioning (disablePositioning)
	
	//TODO: create function to handle positioning updates (onPosition)
		
	
	//TODO: create function to make a WebRequest to the HERE Places API (makePlacesWebRequest)
	
	//TODO: create functions to parse results from Places API call (onPlacesReceive)

	//TODO: create function to set Places display information (setRoutingInfo)
	

	//TODO: create function to make WebRequest to the HERE Routing API (makeRoutingWebrequest)
	
	//TODO: create function to parse results from Routing API call (onRoutingReceive)
	
	//TODO: create function to set Routing display information (setRoutingInfo()
	
	
	//TODO: create function to make ImageRequest to the HERE Map Image API (makeMapImageRequest)
	
	// TODO: create function to parse results from MapImageRequest (onMapImageReceive) 
	
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
	
		function getInstructionText() {
		return instructionText;
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
    	setRoutingInfo();    	
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
}