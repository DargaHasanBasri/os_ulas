import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// ***************************************************************************
/// HomeGoogleMap is the custom Google Map widget used in the app.
/// This widget displays the user's current location and provides
/// a map experience limited to Osmaniye city limits.
/// [mapController] Google Map controller is used to perform programmatic operations on the map.
/// [currentPosition] The user's current location determines the map starting camera.
/// [osmaniyeBounds] Map boundaries prevent the user from going outside Osmaniye.
/// [mapStyle] Used to customize the map style.
/// [onMapCreated] Callback function to be triggered when the map is created.
/// [mapType] Determines the map view.
/// [style] Determines the map style.
/// [initialCameraPosition] The initial display position and initial zoom level are determined.
/// [cameraTargetBounds] Sets camera movement limits.
/// [minMaxZoomPreference] Sets zoom limits.
/// [myLocationEnabled] Show user's location on map.
/// [zoomControlsEnabled] Zoom buttons are off.
/// [myLocationButtonEnabled] Location button is off.
/// ***************************************************************************
class HomeGoogleMap extends StatelessWidget {
  final GoogleMapController? mapController;
  final LatLng? currentPosition;
  final LatLngBounds osmaniyeBounds;
  final String? mapStyle;
  final void Function(GoogleMapController controller)? onMapCreated;

  const HomeGoogleMap({
    super.key,
    required this.currentPosition,
    required this.osmaniyeBounds,
    this.mapController,
    this.mapStyle,
    this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        onMapCreated?.call(controller);
      },
      mapType: MapType.normal,
      style: mapStyle,
      initialCameraPosition: CameraPosition(
        target: currentPosition!,
        zoom: 14,
      ),
      cameraTargetBounds: CameraTargetBounds(
        osmaniyeBounds,
      ),
      minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
    );
  }
}
