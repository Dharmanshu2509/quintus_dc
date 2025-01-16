import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Check location permission
  Future<bool> checkPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  // Get Current Location
  Future<Position?> getCurrentLocation() async {
    // Check if permission is granted
    bool isPermissionGranted = await checkPermission();
    if (!isPermissionGranted) {
      return null; // Handle permission not granted
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }
}
