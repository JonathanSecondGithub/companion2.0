import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SchoolMapPage extends StatefulWidget {
  @override
  _SchoolMapPageState createState() => _SchoolMapPageState();
}

class _SchoolMapPageState extends State<SchoolMapPage> {
  late GoogleMapController mapController;

  // Coordinates for key locations on the school campus
  final LatLng _schoolCenter = LatLng(-1.2921, 36.8219); // Example location
  final List<Map<String, dynamic>> keyLocations = [
    {
      "locationName": "Main Library",
      "position": LatLng(-1.2925, 36.8220),
    },
    {
      "locationName": "Computer Science Building",
      "position": LatLng(-1.2928, 36.8215),
    },
    {
      "locationName": "Cafeteria",
      "position": LatLng(-1.2922, 36.8217),
    },
    {
      "locationName": "Gymnasium",
      "position": LatLng(-1.2920, 36.8225),
    },
    {
      "locationName": "Hostel Block A",
      "position": LatLng(-1.2930, 36.8221),
    },
  ];

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    for (var location in keyLocations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location['locationName']),
          position: location['position'],
          infoWindow: InfoWindow(
            title: location['locationName'],
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Map'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campus Map',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Explore the key locations of our school campus',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _schoolCenter,
                  zoom: 16.0,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Key Locations',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: keyLocations
                    .map((location) => LocationCard(location: location))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final Map<String, dynamic> location;

  LocationCard({required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location['locationName'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Coordinates: ${location['position'].latitude}, ${location['position'].longitude}',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
