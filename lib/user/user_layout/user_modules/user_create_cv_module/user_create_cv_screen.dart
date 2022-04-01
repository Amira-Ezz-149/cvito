import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/user/user_layout/user_layout.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';

import '../user_bottom_navigation_bar_module/user_home_screen_module/user_home_screen.dart';

class UserCreateCVScreen extends StatelessWidget {
  const UserCreateCVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(
                            context: context,
                            widget: const UserLayoutScreen());
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Text(
                      'Create A CV ',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: kCustomBlack),
                    ),
                  ],
                ),
                 SizedBox(height: getProportionateScreenHeight(25.0)),
                const Text('Select your Field!',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: kCustomBlack)),
                SizedBox(height: getProportionateScreenHeight(20.0)),

                ///==========================================================================================
                /// select your field
                SizedBox(
                    height: getProportionateScreenHeight(220),
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          child: Image.asset(
                              'assets/images/technical_or_general.png'),
                          onTap: () {
                            showModalBottomSheet(
                                // enableDrag: false,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                context: context,
                                builder: (context) => buildSheet(context));
                          },
                        ),
                        Image.asset('assets/images/medical_field.png'),
                        Image.asset('assets/images/graphic_design.png'),
                      ],
                    )),
               const SizedBox(height: 20.0,),
                const Text('CVs',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: kCustomBlack)),
                const SizedBox(height: 10),

                ///======================================================================================
                ///CVs
                Container(
                  height: getProportionateScreenHeight(290),
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image.asset('assets/images/automated.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Image.asset(
                            'assets/images/manual.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSheet(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        height: MediaQuery.of(context).size.height / 2,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 100.0,
                height: 7.0,
                decoration: BoxDecoration(
                    color: kCustomBlack,
                    borderRadius: BorderRadius.circular(10.0)),
              )),
              const SizedBox(height: 20.0),
              const Text('Opened Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: kCustomBlack)),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Image.asset(
                        'assets/images/professional.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Image.asset(
                        'assets/images/modern.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
