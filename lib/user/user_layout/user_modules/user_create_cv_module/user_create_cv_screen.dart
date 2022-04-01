import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';

import '../user_bottom_navigation_bar_module/user_home_screen_module/user_home_screen.dart';

class UserCreateCVScreen extends StatelessWidget {
  const UserCreateCVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30.0, 15.0, 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      navigateTo(
                          context: context, widget: const UserHomeScreen());
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20.0),
                  const Text(
                    'Create A CV ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: kCustomBlack),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              const Text('Choose your Field!',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: kCustomBlack)),


              SizedBox(
                height: getProportionateScreenHeight(20.0),
              ),
              SizedBox(
                // color: Colors.red,
                height: getProportionateScreenHeight(220),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/technical_or_general.png'),
                    Image.asset('assets/images/technical_or_general.png'),
                    Image.asset('assets/images/technical_or_general.png'),
                  ],
                )
              ),

              SizedBox(height: getProportionateScreenHeight(50),),

              const Text('Opened Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: kCustomBlack)),
            ],
          ),
        ),
      ),
    );
  }
}
