import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = (-1).obs; // Initially, no item is selected
  var currentLocation = "New York, NY".obs;
  var banners = <String>[
    "assets/images/b1.jpeg",
    "assets/images/b2.jpeg",
    "assets/images/b3.jpeg"
  ].obs;
  var categories = <Map<String, String>>[
    {"name": "Bakery", "image": "assets/images/l1.png"},
    {"name": "Fashion & Apparel", "image": "assets/images/l2.jpeg"},
    {"name": "Agriculture\n& Farming", "image": "assets/images/l3.jpeg"},
    {"name": "General Store", "image": "assets/images/l4.png"},
  ].obs;
  var topStores = <Map<String, String>>[
    {"name": "Pixel Store", "image": "assets/images/g1.png"},
    {"name": "Boutique Store", "image": "assets/images/g2.png"},
  ].obs;

  var vector = <String>["assets/images/vector.png"].obs;
}
