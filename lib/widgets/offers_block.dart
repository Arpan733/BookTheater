import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../model/offer_model.dart';
import '../utils/dummy_data.dart';

class OffersBlock extends StatelessWidget {
  const OffersBlock({Key? key}) : super(key: key);

  offerWidget(BuildContext context, OfferModel model) => Padding(
        padding: const EdgeInsets.only(left: 5, right: 15),
        child: DottedBorder(
          dashPattern: const [0.8, 1],
          strokeWidth: 1,
          padding: const EdgeInsets.all(20),
          radius: const Radius.circular(6),
          child: Row(
            children: [
              Container(
                height: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(
                    colors: [
                      model.gradientColor[0].withOpacity(0.6),
                      model.gradientColor[1].withOpacity(0.6),
                    ],
                    radius: 20,
                  ),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  color: model.color,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      color: model.color,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      model.description,
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Offers",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: offers.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => offerWidget(context, offers[index]),
            ),
          ),
        ],
      ),
    );
  }
}
