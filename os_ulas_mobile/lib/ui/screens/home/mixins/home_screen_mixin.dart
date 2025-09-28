import '../export.dart';

mixin HomeScreenMixin<T extends StatefulWidget> on State<T> {
  GoogleMapController? mapController;
  LatLng? currentPosition;
  String? mapStyle;

  TextEditingController searchTextEditingController = TextEditingController();

  final GlobalKey<TooltipState> feedbackTooltipKey = GlobalKey<TooltipState>();
  final GlobalKey<ScaffoldState> scaffoldKey  = GlobalKey<ScaffoldState>();

  final LatLng osmaniyeCenter = const LatLng(37.0745, 36.2466);

  final LatLngBounds osmaniyeBounds = LatLngBounds(
    southwest: LatLng(36.9500, 36.0000),
    northeast: LatLng(37.5000, 37.0000),
  );

  Future<void> getUserLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => currentPosition = osmaniyeCenter);
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => currentPosition = osmaniyeCenter);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => currentPosition = osmaniyeCenter);
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final userLatLng = LatLng(position.latitude, position.longitude);

      if (osmaniyeBounds.contains(userLatLng)) {
        setState(() => currentPosition = userLatLng);
      } else {
        setState(() => currentPosition = osmaniyeCenter);
      }

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(currentPosition!, 15),
      );
    } catch (e) {
      setState(() => currentPosition = osmaniyeCenter);
    }
  }

  Future<void> loadMapStyle() async {
    final isDarkMode =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;

    final stylePath =
        isDarkMode
            ? 'assets/map_themes/map_dark.json'
            : 'assets/map_themes/map_light.json';

    mapStyle = await rootBundle.loadString(stylePath);
    setState(() {});
  }

  void showFeedbackTooltip() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      feedbackTooltipKey.currentState?.ensureTooltipVisible();
    });
  }

  Future<void> loadMapAndShowTooltip() async {
    await getUserLocation();
    await loadMapStyle();
    showFeedbackTooltip();
  }
}
