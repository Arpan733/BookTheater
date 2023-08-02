import 'package:booktheater/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';
import '../utils/mytheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  late AnimationController _animationController;
  late Animation<Offset> _animationImage, _animationCamara;

  @override
  void initState() {
    Get.put(ProfileController());
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationImage =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.4))
            .animate(_animationController);
    _animationCamara =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.1))
            .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Mytheme.statusBarColor));

    final size = MediaQuery.of(context).size;

    String? PicUrl = AuthController.instance.user?.photoURL;
    PicUrl = PicUrl ?? Constants.dummyAvatar;

    String? name = AuthController.instance.user!.displayName ?? "No name";
    String? email = AuthController.instance.user!.email;
    String? mobile = AuthController.instance.user!.phoneNumber ?? "0000000000";
    mobileController.text = mobile;
    nameController.text = name;
    emailController.text = email.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
                  _animationController.forward();
                } else if (notification.metrics.pixels ==
                    notification.metrics.minScrollExtent * 0.5) {
                  _animationController.reverse();
                }

                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: Mytheme.statusBarColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Name"),
                    ),
                    Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            initialValue: name,
                            style: const TextStyle(color: Colors.black),
                            readOnly:
                                ProfileController.instance.isEditName.value,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFE4EDFF)),
                                  child: const Icon(
                                    Icons.person_outline,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance.toggleEditName();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Email"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        initialValue: email,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE8D8FF)),
                              child: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFFCC80EA),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Mobile No"),
                    ),
                    Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            initialValue: mobile,
                            style: const TextStyle(color: Colors.black),
                            readOnly:
                                ProfileController.instance.isEditMoNumber.value,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFCCEFE0)),
                                  child: const Icon(
                                    Icons.phone_android_outlined,
                                    color: Color(0xFF48EB9F),
                                  ),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  ProfileController.instance
                                      .toggleEditMoNumber();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xFF4C7EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    const Divider(
                      thickness: 1,
                      color: Mytheme.greyColor,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("DOCUMENTATION"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.privacy_tip_outlined,
                          size: 20,
                        ),
                        title: const Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.share_outlined,
                          size: 16,
                        ),
                        title: const Text("Share"),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.exit_to_app_outlined,
                          size: 16,
                          color: Colors.red,
                        ),
                        title: const Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          AuthController.instance.SignOut();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: size.width * 0.5 - 60,
              child: SlideTransition(
                position: _animationImage,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(60),
                      color: Mytheme.statusBarColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        PicUrl,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: size.width * 0.5 + 20,
              child: SlideTransition(
                position: _animationCamara,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Mytheme.statusBarColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
