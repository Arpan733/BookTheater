import 'package:booktheater/controllers/location_controller.dart';
import 'package:booktheater/pages/home_page.dart';
import 'package:booktheater/utils/dummy_data.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  Widget myCurrentLoaction = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GestureDetector(
      onTap: () {
        LocationController.instance.getLocation();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Mytheme.greyColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(15),
        child: const Row(
          children: [
            Icon(
              Icons.my_location,
              color: Colors.black45,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "My Curent Location",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget suggestedLocation(String city) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black45,
            width: 1,
          ),
        ),
        child: Text(city),
      );

  @override
  void initState() {
    super.initState();
    Get.put(LocationController);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) => Obx(
          () => LoadingOverlay(
            isLoading: LocationController.instance.isLocating.value,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myCurrentLoaction,
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: LayoutBuilder(
                      builder: (context, constraints) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cities.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth > 480 ? 5 : 3,
                          childAspectRatio: 2.3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            LocationController.instance.setCity(cities[index]);
                            Get.offAll(() => const HomePage());
                          },
                          child: suggestedLocation(cities[index]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Mytheme.greyColor,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          maxWidth: 50,
                          maxHeight: 50,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            "assets/images/SearchBlack.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
