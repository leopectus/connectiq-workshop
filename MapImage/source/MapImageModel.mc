using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;

class MapImageModel
{
	// makeWebRequest parameters
	var url;
	var parameters;
	var options;	
	
	// positioning data
	var lat;
	var long;	
	
	// map image API result
	var mapImage;
	
	function initialize () {
		enablePositioning();	
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
	}	
	
	function getMapImage() {
		return mapImage;
		System.println(mapImage);
	}

	function makeMapImageRequest() {
	            
        url = "https://image.maps.api.here.com/mia/1.6/mapview";
        
    	parameters = {
    		"app_id" => Ui.loadResource(Rez.Strings.app_id),
		    "app_code" => Ui.loadResource(Rez.Strings.app_code),
		    "c" => lat + "," + long,		    
		    "h" => "210",
		    "w" => "210",
		    "z" => "14",
		    "f" => "4"		    
		};	
	
		options = {		
			:dithering => Communications.IMAGE_DITHERING_FLOYD_STEINBERG
		};
		
        Comm.makeImageRequest(
            url,
            parameters,
            options,
            method(:onReceive)         
        );
    }    
    
    function onReceive(responseCode, data) {    	
        if (responseCode == 200) {        	
        	mapImage = data;
    		Ui.requestUpdate();
        } else {
        	System.println("Error: " + responseCode);       	
        }
    }    
    
}