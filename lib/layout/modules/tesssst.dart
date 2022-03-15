///لو في أي كود محتاجين نشيله على جمب علشان نتيست كود تاني ممكن نحطه هنا مؤقتًاimport 'dart:io';
/*
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_about_company_screen.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_home_company_screen.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_jobs_company_screen.dart';
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

  File? image1;

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
    }
  }

  File? image2;

  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image2 = imageTemporary;
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
                    height: getProportionateScreenHeight(150),
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                      //todo background view image2
                      image: image2 != null? Image.file(
                          image2!,
                        height: getProportionateScreenHeight(150),
                        fit: BoxFit.cover,
                        ).image:

                      AssetImage('assets/images/company_background.png') ,
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
                                  context: context,
                                  widget: const LayoutScreen());
                            },
                          ),
                          TransparentIcon(icon: Icons.edit, onPressed: () {
                            //todo calling background function image2
                            pickImage2();
                          },),
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
                          width: getProportionateScreenWidth(160),
                          height: getProportionateScreenHeight(160),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: image1 != null

                            //todo profile view image1
                                ? Image.file(
                              image1!,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            )
                                : const FlutterLogo(size: 100),
                          ),
                        ),
                        Positioned(
                          child: CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  //todo profile function image1
                                pickImage2();
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
                          ), right: -12,
                          bottom: 5.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(160)),
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

// child: image1 != null
//     ? Image.file(
//   image1!,
//   width: 160,
//   height: 160,
//   fit: BoxFit.cover,
// )
//     : const FlutterLogo(
//   size: 100,
// ),
// image: image1 != null ? Image.file(
//   image1.,
//   width: SizeConfig.screenWidth,
//   height: 100,
//
// ):

*/


/*

import 'dart:io';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_about_company_screen.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_home_company_screen.dart';
import 'package:cvito/layout/modules/tab_bar_company_screens_module/tab_jobs_company_screen.dart';
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
  File? image1;

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
    }
  }

  File? image2;

  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image2 = imageTemporary;
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
                    height: getProportionateScreenHeight(150),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        //todo background view image2
                        image: image2 != null
                            ? Image.file(
                          image2!,
                          height: getProportionateScreenHeight(150),
                          fit: BoxFit.cover,
                        ).image
                            : AssetImage(
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
                              navigateTo(
                                  context: context,
                                  widget: const LayoutScreen());
                            },
                          ),
                          TransparentIcon(
                            icon: Icons.edit,
                            onPressed: () {
                              //todo calling background function image2
                              pickImage2();
                            },
                          ),
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
                          width: getProportionateScreenWidth(160),
                          height: getProportionateScreenHeight(160),
                          color: Colors.blue,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            //todo profile view image1
                            child: image1 != null ? Image.file(image1!, width: 160, height: 160, fit: BoxFit.cover,) : const FlutterLogo(size: 100),
                          ),
                        ),
                        //todo profile function image1 //
                        Positioned(
                          child: GestureDetector(
                            onTap: (){
                              print('=========================== profile test ===============================');
                              pickImage1();
                            },
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: kBasicColor,
                                size: 15,
                              ),
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          right: -12,
                          bottom: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(120)),
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
// IconButton(
//     onPressed: () {
//
//       pickImage2();
//       debugPrint(
//           '==========test profile photo================');
//     },
//     icon: const Icon(
//       Icons.add,
//       color: kBasicColor,
//       size: 15,
//     )),
*/

/*
import 'dart:io';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/software_company_module/tab_bar_company_screens_module/tab_about_company_screen.dart';
import 'package:cvito/layout/modules/software_company_module/tab_bar_company_screens_module/tab_home_company_screen.dart';
import 'package:cvito/layout/modules/software_company_module/tab_bar_company_screens_module/tab_jobs_company_screen.dart';
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
  File? image1;

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
    }
  }

  File? image2;

  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image2 = imageTemporary;
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
                    height: getProportionateScreenHeight(150),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        //todo background view image2
                        image: image2 != null
                            ? Image.file(
                          image2!,
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
                              navigateTo(
                                  context: context,
                                  widget: const LayoutScreen());
                            },
                          ),
                          TransparentIcon(
                            icon: Icons.edit,
                            onPressed: () {
                              //todo calling background function image2
                              pickImage2();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///===========================================================
                  ///profile photo
                  Positioned(
                    top: 60,
                    left: 15,
                    child: Container(
                      width: getProportionateScreenWidth(160),
                      height: getProportionateScreenHeight(160),
                      color: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        //todo profile view image1
                        child: image1 != null ? Image.file(image1!, width: 160, height: 160, fit: BoxFit.cover,) : const FlutterLogo(size: 100),
                      ),
                    ),
                  ),
                  //todo profile function image1
                  Positioned(
                    top:getProportionateScreenHeight(120),
                    left: 160,
                    child: GestureDetector(
                      onTap: (){
                        print('=========================== profile test ===============================');
                        pickImage1();
                      },
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.add,
                          color: kBasicColor,
                          size: 15,
                        ),
                        radius: 15,
                        backgroundColor: Colors.white,
                      ),
                    ),

                  ),


                ],
              ),
              SizedBox(height: getProportionateScreenHeight(120)),
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
                        TabHomeCompanyScreen(),
                        TabAboutCompanyScreen(),
                        TabJobsCompanyScreen()
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
// IconButton(
//     onPressed: () {
//
//       pickImage2();
//       debugPrint(
//           '==========test profile photo================');
//     },
//     icon: const Icon(
//       Icons.add,
//       color: kBasicColor,
//       size: 15,
//     )),
*/

/*

import 'dart:io';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/software_company_module/tab_bar_company_screens_module/tab_home_company_screen.dart';
import 'package:cvito/layout/modules/software_company_module/tab_bar_company_screens_module/tab_jobs_company_screen.dart';
import 'package:cvito/layout/modules/user_profile_module/tab_bar_user_profile_screens_modules/tab_about_user_screen.dart';
import 'package:cvito/layout/widgets/basic_custom_button.dart';
import 'package:cvito/layout/widgets/transparent_icon.dart';
import 'package:cvito/utilities.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

/// for multi provider TickerProviderStateMixin
/// for single provider SingleTickerProviderStateMixin

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  File? image1;

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
    }
  }

  File? image2;

  // Future pickImage2() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image2 = imageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     debugPrint('failed to pick image : $e');
  //   }
  // }

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
                          //todo background view image2
                          image: image2 != null
                              ? Image.file(
                            image2!,
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
                                navigateTo(
                                    context: context,
                                    widget: const LayoutScreen());
                              },
                            ),
                            TransparentIcon(
                              icon: Icons.edit,
                              onPressed: () {
                                //todo calling background function image2
                                pickImage2();
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
                                  //todo profile view image1
                                  child: image1 != null
                                      ? Image.file(
                                    image1!,
                                    width: 160,
                                    height:
                                    getProportionateScreenHeight(170),
                                    fit: BoxFit.cover,
                                  )
                                      : const FlutterLogo(size: 100),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -5,
                            bottom: 15,
                            // alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              // behavior: HitTestBehavior.translucent,
                              onTap: () {
                                //todo calling profile function image1
                                print('onClick');
                                pickImage1();
                              },
                              child: const CircleAvatar(
                                child: Icon(
                                  Icons.add,
                                  color: kBasicColor,
                                  size: 15,
                                ),
                                radius: 15,
                                backgroundColor: Colors.white,
                              ),
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
                      "Eyad Najy",
                      style: TextStyle(
                          color: kCustomBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Android developer",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: kCustomBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(
                          "giza - egypt ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0),
                        ),
                      ],
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
                          Tab(text: 'About'),
                          Tab(text: 'Experience'),
                          Tab(text: 'Education'),
                        ]),

                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(300),
                      child: TabBarView(controller: _tabController, children: [
                        TabAboutUserScreen(),
                        TabHomeCompanyScreen(),
                        TabJobsCompanyScreen()
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
*/
