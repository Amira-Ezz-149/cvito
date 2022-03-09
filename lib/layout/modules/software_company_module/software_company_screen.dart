import 'dart:io';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/tab_bar_screens_module/tab_about_screen.dart';
import 'package:cvito/layout/modules/tab_bar_screens_module/tab_home_screen.dart';
import 'package:cvito/layout/modules/tab_bar_screens_module/tab_jobs_screen.dart';
import 'package:cvito/layout/widgets/basic_custom_button.dart';
import 'package:cvito/layout/widgets/transparent_icon.dart';
import 'package:cvito/utilities.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

/// for multi provider TickerProviderStateMixin
/// for single provider SingleTickerProviderStateMixin

class SoftwareCompanyScreen extends StatefulWidget {
  @override
  State<SoftwareCompanyScreen> createState() => _SoftwareCompanyScreenState();
}

class _SoftwareCompanyScreenState extends State<SoftwareCompanyScreen>
    with TickerProviderStateMixin {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===========================================================
              /// profile cover
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/company_background.png'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransparentIcon(
                              icon: Icons.arrow_back,
                            onPressed: () {
                              navigateTo(
                                  context: context, widget: const LayoutScreen());
                            },
                              ),
                          TransparentIcon(icon: Icons.edit),
                        ],
                      ),
                    ),
                  ),

                  ///===========================================================
                  ///profile photo
                  Positioned(
                    top: 60.0,
                    left: 15.0,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          color: kBasicColor,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: image != null
                                ? Image.file(
                                    image!,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  )
                                : const FlutterLogo(
                                    size: 100,
                                  ),
                          ),
                        ),
                        Positioned(
                          right: -12,
                          bottom: 5.0,
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                              debugPrint('=================================');
                            },
                            child: CircleAvatar(
                              child: IconButton(
                                  onPressed: () {
                                    // pickImage();
                                    debugPrint(
                                        '=================================');
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: kBasicColor,
                                    size: 15,
                                  )),
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 66.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///=========================================================
                    ///company title and its description
                    const Text(
                      "Software Company",
                      style: TextStyle(
                          color: kCustomBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Egypt software company building mobile applications ",
                      style: TextStyle(
                          color: kCustomBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Staffing & Recruiting . Cairo,Egypt . 200,00 employees ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 13.0),
                    ),

                    ///=========================================================
                    ///edit profile
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Row(
                        children: [
                          BasicCustomButton(
                              text: 'Edit Profile',
                              function: () {
                                debugPrint('edit profile');
                              }),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.more_horiz_outlined,
                                color: Colors.grey,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: kBasicColor,
                        labelColor: kBasicColor,
                        tabs: const [
                          Tab(text: 'Home'),
                          Tab(text: 'About'),
                          Tab(text: 'Jobs'),
                        ]),

                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(300),
                      child: TabBarView(controller: _tabController, children: [
                        TabHomeScreen(),
                        TabAboutScreen(),
                        TabJobsScreen()
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AssetImage(
// 'assets/images/grammer_chaeck.png'),

// Container(
// width: 100,
// height: 100,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: image != null ? Image.file(
// image!, width: 100,
// height: 100,
// fit: BoxFit.cover,) :
// ),
// color: kBasicColor,
// borderRadius: BorderRadius.circular(5.0),
// ),
// ),
