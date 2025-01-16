import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var currentLocation = "Fetching location...".obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
  }

  Future<void> fetchLocation() async {
    try {
      // Request location permission
      LocationPermission permission = await Geolocator.requestPermission();

      // Check if location services are enabled
      if (!await Geolocator.isLocationServiceEnabled()) {
        currentLocation.value = "Location services are disabled.";
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Get place name from latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentLocation.value = "${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      } else {
        currentLocation.value = "Unable to fetch location.";
      }
    } catch (e) {
      currentLocation.value = "Error: $e";
    }
  }
}
