import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/location_controller.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';

class FacilityBottomSheet extends StatelessWidget {
  final dynamic model;

  FacilityBottomSheet({Key? key, required this.model}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(23.106558, 72.604289),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
                    zoomControlsEnabled: false,
                    initialCameraPosition: kGooglePlex,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF999999),
                        size: 25,
                      ),
                    ),
                    TextSpan(
                      text: LocationController.instance.city.value,
                      style: const TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.fullAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF999999),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Facilities",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF999999),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.facilities.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Mytheme.splash.withOpacity(0.3),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                facilityAsset[index],
                                height: 15,
                                width: 15,
                              ),
                            ),
                          ),
                          Text(
                            model.facilities[index],
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Mytheme.splash,
              radius: 40,
              child: Image.asset(
                "assets/images/Map.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
