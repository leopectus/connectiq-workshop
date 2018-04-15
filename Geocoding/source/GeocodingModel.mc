using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;

class GeocodingModel
{
	// WebRequest parameters
	var url;
	var parameters;
	var options;	
	
	// positioning data
	var lat;
	var long;	
	
	// geodcoding result
	var addressText;
	
	function initialize () {		
		addressText = "Press Start\n to find your address";
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
	
	function getAddressText() {
		return addressText;
	}

	function makeGeocoderWebRequest() {
	            
        url = "https://reverse.geocoder.api.here.com/6.2/reversegeocode.json";
            
    	parameters = {
    		"app_id" => Ui.loadResource(Rez.Strings.app_id),
		    "app_code" => Ui.loadResource(Rez.Strings.app_code),
		    "prox" => lat + "," + long + ",250",		    
		    "mode" => "retrieveAddress"
		};	
	
		options = {		
			:responseType => Comm.HTTP_RESPONSE_CONTENT_TYPE_JSON
		};
		
        Comm.makeWebRequest(
            url,
            parameters,
            options,
            method(:onReceive)         
        );
    }    
    
    function onReceive(responseCode, data) {    	
        if (responseCode == 200) {        	
        	parseResponse(data);
        } else {
        	addressText = responseCode;       	
        }
    }
    
    function parseResponse(data) {    
    	var response = data.get("Response");
    	var viewArray = response.get("View");
    	var view = viewArray[0];
    	var resultArray = view.get("Result");
    	var result = resultArray[0];
    	var location = result.get("Location");
    	var address = location.get("Address");
    	
    	addressText = address.get("Label");
    	
    	Ui.requestUpdate();  
   	}
}