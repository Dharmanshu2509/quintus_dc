import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/home_controller.dart';
import '../controller/location_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  final LocationController locationController = Get.put(LocationController());

  int _selectedIndex = 0; // To track the selected tab index

  @override
  void initState() {
    super.initState();
    // Call the fetchLocation method when the screen is initialized
    locationController.fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF35035C),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "VOSOSHOP",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Groceries delivered fresh and fast",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search for store/item",
                              hintStyle: TextStyle(color: Color(0xFF87848A)),
                              suffixIcon: Icon(Icons.mic),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/instant_time.png"),
                    Obx(
                      () => SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                locationController.currentLocation.value,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel
              Container(
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Obx(() => CarouselSlider.builder(
                      itemCount: controller.banners.length,
                      itemBuilder: (context, index, realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            child: Image.asset(
                              controller.banners[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 0.75,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              // Blue Line with Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  //height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 53, 3, 92),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/vector.png",
                        scale: 3.5,
                      ),
                      const SizedBox(width: 5),
                      Text("Get 10% Off on adding items worth ₹999 to cart! ",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF35035C)),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Explore by Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore By Categories",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF35035C)),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF35035C)),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 19,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 130,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // Update selected index on tap
                          setState(() {
                            controller.selectedIndex.value = index;
                          });
                        },
                        child: Container(
                          width: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Image with border radius and conditional border
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      15), // Circular border radius
                                  border: Border.all(
                                    color: controller.selectedIndex.value ==
                                            index
                                        ? const Color(0xFF35035C)
                                        : Colors
                                            .transparent, // Purple border if selected
                                    width: 0.5,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    controller.categories[index]['image']!,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Text with conditional color
                              Text(
                                controller.categories[index]['name']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: controller.selectedIndex.value ==
                                              index
                                          ? const Color(0xFF35035C)
                                          : const Color(0xFF555555),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              // Top Stores Heading
              Center(
                child: Text(
                  "Top Stores",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF35035C)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Top Stores Grid
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 10, // Space between rows
                    ),
                    itemCount: controller.topStores.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                15), // Circular border radius
                            border: Border.all(
                              color: const Color(0xFFEBE6EF), // Border color
                              width: 0.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              controller.topStores[index]['image']!,
                              width: MediaQuery.of(context).size.width *
                                  0.45, // Responsive width
                              height: MediaQuery.of(context).size.width *
                                  0.45, // Responsive height
                              fit: BoxFit.cover, // Maintain aspect ratio
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          controller.topStores[index]['name']!,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF35035C))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
        currentIndex: _selectedIndex, // Selects the default active tab
        unselectedItemColor: const Color(0xFF87848A), // Unselected icons color
        selectedItemColor: const Color(0xFF35035C), // Selected icon color
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update selected tab
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
