class PositioningModel
{
	var lat;
	var long;
	var accuracy;
	var locationText;
	
	function initialize () {
		locationText = "Waiting for GPS";
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
		var accuracyText = "";
		
		 if (info.accuracy == Position.QUALITY_GOOD) {
		 	accuracyText = "GPS quality: good.";
		 } else if (info.accuracy == Position.QUALITY_USABLE) {
		 	accuracyText = "GPS quality: usable.";
		 } else if (info.accuracy == Position.QUALITY_POOR) {
		 	accuracyText = "GPS quality: poor.";
		 } else if (info.accuracy == Position.QUALITY_LAST_KNOWN) {
		 	accuracyText = "GPS quality: last known";
		 } else if (info.accuracy == Position.QUALITY_NOT_AVAILABLE) {
		 	accuracyText = "GPS quality: not available.";
		 }
		
		locationText = lat.toString() + ",\n" +
		long.toString() + "\n" +
		accuracyText;		
	}
	
	function getLocationText() {
		return locationText;
	}	
}