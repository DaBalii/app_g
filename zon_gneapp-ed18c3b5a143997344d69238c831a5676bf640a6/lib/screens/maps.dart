import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zon_gneapp/model/maison.dart';
import 'package:zon_gneapp/service/api_service.dart';

import '../providers/home_provider.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}





class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  LatLng? currentPosition;
  var homes = [];
  var positions = [];
  Set<Marker> markersSet = {};
  HomesPrivders? homesPrivders;
 /* getData() async {
    await ApiService().getAllHomes().then((value) {
      if (value.isEmpty) {
        print("hello");
      } else {
        setState(() {
          homes = value;
          positions = homes.map((element) {
            // Assuming element.description contains the position information like 'LNG12,55,LAT4,447'
            final parts = element.description.split(',');
            final lat = double.parse(parts[1].substring(3));
            final lng = double.parse(parts[0].substring(3));
            return {'id': element.description, 'position': LatLng(lat, lng)};
          }).toList();
        });
      }
    });
    print(homes);
    print(positions);
  }*/



  Future<void>buildMarkers() async
  {
    List<Maison>homes = homesPrivders!.listMaisons!;
    markersSet =homes.map((e) {
      final parts = e.position.split(',');
      final lat = double.parse(parts[1].substring(3));
      final lng = double.parse(parts[0].substring(3));
      return Marker(

      markerId: MarkerId(e.id.toString()),
      infoWindow: const InfoWindow(
        title: "Test"
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat,lng)

      );}).toSet();
  }


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    homesPrivders=Provider.of<HomesPrivders>(context, listen: false);
    buildMarkers();
   // getData();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: currentPosition == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: currentPosition!,
          zoom: 15.0,
        ),
        markers:markersSet
      ),
    );
  }
}
