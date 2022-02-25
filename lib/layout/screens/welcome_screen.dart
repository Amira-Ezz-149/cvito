import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/screens/get_started_screen.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import '../widgets/basic_custom_button.dart';
import '../widgets/intro_slider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;
  List<Map> welcomeData = [
    ///============================================
    /// Create An Automated CV   ... rafiki image
    {
      "title": "Create An Automated CV",
      "description": "Our app helps you to build an automated CV differently!",
      "image": "assets/images/rafiki.png"
    },

    ///=====================================================================================
    /// find your job ....bro image

    {
      "title": 'Find Your Job',
      "description":
          "It will also help you to find a job remotely without recruiters.",
      "image": "assets/images/bro.png"
    },

    ///======================================================================================
    ///find Employess  ....business image

    {
      "title": "Find Employees",
      "description": "A company can also find its employees!",
      "image": "assets/images/business.png"
    },

    ///============================================================================================
    ///Create a manual CV  ....rafikti image

    {
      "title": "Create A Manual CV",
      "description":
          "Create your CV with yourself and customize it with any template that attracts you.",
      "image": "assets/images/rafikti.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      ///white60
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: welcomeData.length,
                  itemBuilder: (context, index) => IntroSliderContent(
                    title: welcomeData[index]['title'],
                    description: welcomeData[index]['description'],
                    imageLink: welcomeData[index]['image'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),

                      ///===============================================
                      ///swapping between images
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          welcomeData.length,

                          ///============================================
                          ///slider
                              (index) => buildDot(
                            index: index,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),

                      ///=================================================
                      /// next button
                      SizedBox(
                        child: BasicCustomButton(
                            text: 'Start',
                            function: () {
                              navigateTo(
                                  context: context, widget: GetStartedScreen());
                            }),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kBasicColor : Colors.grey,
          borderRadius: BorderRadius.circular(3)),
      duration: kAnimationDuration,
    );
  }
}
