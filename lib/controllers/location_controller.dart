import 'package:booktheater/utils/dummy_data.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  RxString city = cities[0].obs;
  static LocationController instance = Get.find();
  RxBool isLocating = false.obs;
  RxString? location;

  @override
  void onReady() {
    getLocation();
    super.onReady();
  }

  void getLocation() async {
    Location location = Location();
    LocationData locationData;

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    isLocating = true.obs;

    locationData = await location.getLocation();
    var address = await geo.GeocodingPlatform.instance.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );

    isLocating = false.obs;

    print(address[0].subLocality);
    setCity(address[0].subLocality!);
  }

  setCity(String myCity) {
    city = myCity.obs;
    update();
  }
}
