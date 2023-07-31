import 'dart:convert';
import 'dart:math';

import 'package:booktheater/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/constants.dart';

class SeatSelectionController extends GetxController {
  static SeatSelectionController instance = Get.find();
  RxInt timeSelectedIndex = 0.obs;
  static int indexValue = -1;
  RxInt noOfSeats = indexValue.obs;
  RxInt seatTypes = indexValue.obs;
  RxBool isSelecation = false.obs;
  RxList selectedSeats = [].obs;
  RxDouble seatPrice = 0.0.obs;
  RxList seatPriceList = [].obs;
  late Razorpay _razorpay;
  static const String _chars = '1234567890';
  final Random _rnd = Random();

  @override
  void onInit() {
    noOfSeats = indexValue.obs;
    seatTypes = indexValue.obs;
    super.onInit();
  }

  Widget getImage() {
    int val = noOfSeats.value;

    if (val <= 2) {
      return Container(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Image.asset(
          "assets/images/Vespa.png",
          fit: BoxFit.fill,
        ),
      );
    } else if (val > 2 && val <= 4) {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Car.png",
        ),
      );
    } else if (val > 4 && val <= 8) {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Van.png",
        ),
      );
    } else {
      return SizedBox(
        height: 150,
        child: Image.asset(
          "assets/images/Bus.png",
        ),
      );
    }
  }

  updateNoOfSeates(int value) {
    noOfSeats = value.obs;
    update();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void createOrder() async {
    http.Response res = await http.post(
      Uri.parse(Constants.createOrderUrl),
      headers: {
        'content-type': 'application/json',
        'authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.keyId}:${Constants.keySecret}'))}'
      },
      body: jsonEncode({
        "amount": seatPrice.value * 100.00,
        "currency": "INR",
        "receipt": 'recpt_${getRandomString(4)}',
      }),
    );

    print(res.body);
    String orderId = jsonDecode(res.body)["id"];
    print(orderId);
    createPayment(orderID: orderId);
  }

  void createPayment({required String orderID}) {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    var options = {
      'key': Constants.keySecret,
      'amount': seatPrice.value * 100.00,
      'name': 'BookTheater',
      'order_id': orderID,
      'description': 'Movie Ticket Amount',
      'timeout': 300,
      'prefill': {
        'contact':
            AuthController.instance.user!.phoneNumber as String ?? "9876543210",
        'email': AuthController.instance.user!.email as String,
      }
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    AuthController.instance.getSuccessorSnackBar(
        "Payment Success for order Id: ${response.orderId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    AuthController.instance
        .getErrorSnackBarNew("Payment Failed: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
