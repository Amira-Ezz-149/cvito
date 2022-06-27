import 'dart:io';
import 'package:cvito/company/company_layout/company_modules/company_bottom_navigation_bar_module/company_home_screen_module/home_screen.dart';
import 'package:cvito/company/company_layout/company_modules/cv_layout.dart';
import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/company/company_layout/company_modules/user_profile_module/tab_bar_user_profile_screens_modules/tab_about_user_screen.dart';
import 'package:cvito/company/company_layout/company_modules/user_profile_module/tab_bar_user_profile_screens_modules/tab_experience_user_screen.dart';
import 'package:cvito/company/company_layout/company_widgets/transparent_icon.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'tab_bar_user_profile_screens_modules/tab_education_user_screen.dart';

/// for multi provider TickerProviderStateMixin
/// for single provider SingleTickerProviderStateMixin

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
  String jobTitle;
  String jobLocation;

  UserProfileScreen({required this.jobTitle, required this.jobLocation});
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  File? profileImage;
  File? backgroundImage;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      return imageTemporary;
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
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===========================================================
              /// profile cover
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(150),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          //todo imageBackground UI
                          image: backgroundImage != null
                              ? Image.file(
                                  backgroundImage!,
                                  height: getProportionateScreenHeight(150),
                                  fit: BoxFit.cover,
                                ).image
                              : const AssetImage(
                                  'assets/images/company_background.png'),
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
                                // navigateTo(context: context, widget: const LayoutScreen());
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///=========================================================================================
                    ///profile photo

                    Positioned(
                      top: 60,
                      left: 15,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(160),
                            height: getProportionateScreenHeight(170),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  // borderRadius: BorderRadius.circular(15.0),
                                  //todo profileImage UI
                                  child: profileImage != null
                                      ? Image.file(
                                          profileImage!,
                                          width: 160,
                                          height:
                                              getProportionateScreenHeight(170),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/developer.jpg',
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20.0)),

              ///===============================================================================================
              ///screen content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///=========================================================
                    ///company title and its description
                    const Text(
                      'Eyad Najy ',
                      style: TextStyle(
                          color: kCustomBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.jobTitle,
                      style: const TextStyle(
                          letterSpacing: 1,
                          color: kCustomBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(
                          widget.jobLocation,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                    TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: kBasicColor,
                        labelColor: kBasicColor,
                        tabs: const [
                          Tab(text: 'About'),
                          Tab(text: 'Experience'),
                          Tab(text: 'Education'),
                        ]),

                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(300),
                      child: TabBarView(controller: _tabController, children: [
                        TabAboutUserScreen(),
                        TabExperienceUserScreen(),
                        TabEducationUserScreen(),
                        // TabEducationUserScreen()
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
