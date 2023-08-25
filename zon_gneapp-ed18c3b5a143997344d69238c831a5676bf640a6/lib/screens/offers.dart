import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF707070),
            ),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "votre Carte",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
          Expanded(
            child: MapsScreen(),
          ),
        ],
      ),
    );
  }
}

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-34, 151), // Coordonnées du centre de la carte
          zoom: 12.0, // Niveau de zoom initial
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: Set<Marker>.of([
          Marker(
            markerId: MarkerId('sydney'),
            position: LatLng(-34, 151),
            infoWindow: InfoWindow(title: 'Marker à Sydney'),
          ),
        ]),
      ),
    );
  }
}
