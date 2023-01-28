import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart'as loc;
Future<bool> checkPermissionStatus() async {
  var status = await Permission.locationWhenInUse.status;
  print(status);

  if (status != PermissionStatus.granted) {
    print(status);
    var requestStatus = await Permission.locationWhenInUse.request();
    if (requestStatus == PermissionStatus.granted) {
      return await enableLocationService();
    } else {
      return false;
    }
  } else {
    return await enableLocationService();
  }
}

Future<bool> enableLocationService() async {
  var location = loc.Location();
  bool enabled = await location.requestService();
  print(enabled);
  // if (enabled) {
  //   var myPosition = await Geolocator.getCurrentPosition();
  //   usersRef.doc(auth.FirebaseAuth.instance.currentUser!.uid).update({
  //     "latitude": myPosition.latitude,
  //     "longitude": myPosition.longitude,
  //   });
  // }

  return enabled;
}
Future<String?> getAddressFromCurrentLocation() async {
  var position = await Geolocator.getCurrentPosition();
  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  print(placemarks);
  var locality = placemarks.first.locality;
  var name = placemarks.first.name;
  var country = placemarks.first.isoCountryCode;
  var subAdminArea = placemarks.first.subAdministrativeArea;
  return "${locality != null ? locality + ", " : ""}${name != null ? name + ", " : ""}${subAdminArea != null ? subAdminArea + ", " : ""}${country != null ? country : ""}";
}