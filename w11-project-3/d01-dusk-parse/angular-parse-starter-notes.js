// app ID
    Parse.initialize("__YOUR_API_KEY", "__YOUR_APP_KEY");

var WayPoints = Parse.Object.extend("waypoints");

// Uncomment to CREATE A GEOPOINT with these lat-lng values:
//37.7331° N, 122.5031° W

var point = new WayPoint();
var geoPoint = new Parse.GeoPoint({latitude: 37.7331, longitude: -122.5031});

point.set("geopoints", geoPoint );

point.save(null, {
  success: function(point) {
    // Execute any logic that should take place after the object is saved.
    console.log('New point created with objectId: ' + point.id);
  },
  error: function(point, error) {
    // Execute any logic that should take place if the save fails.
    // error is a Parse.Error with an error code and message.
    console.log('Failed to create point object, with error code: ' + error.message);
  }
});

// query an object.

var query = new Parse.Query(WayPoints);
query.notEqualTo("objectId", "3HB78uhj3S");  // cheap trick
query.find({
  success: function(results) {
    console.log("Successfully retrieved " + results.length + " waypoints.");
    // Do something with the returned Parse.Object values
    for (var i = 0; i < results.length; i++){ 
      var object = results[i];
      $('#target').append('<li>' + object.id + ' - ' + object.get('geopoints').latitude + object.get('geopoints').longitude + ' - ' + object.get('title') + '</li>');
    }
  },
  error: function(error) {
    console.log("Error: " + error.code + " " + error.message);
  }
});



// CREATE A CAR:
var CarObject = Parse.Object.extend("cars");
var newCar = new CarObject();

newCar.set("brand", "Subaru");
newCar.set("model", "Forester");
newCar.set("yearBuilt", 2011);

newCar.save(null, {
  success: function(newCar) {
    // Execute any logic that should take place after the object is saved.
    console.log('New CarObject created with objectId: ' + newCar.id);
  },
  error: function(newCar, error) {
    // Execute any logic that should take place if the save fails.
    // error is a Parse.Error with an error code and message.
     console.log('Failed to create newCar object, with error code: ' + error.message);
  }
});
