import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/company/company_layout/company_modules/sleek_slider.dart';
import 'package:cvito/company/company_layout/company_widgets/country_container_performance.dart';
import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBasicColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///=================================================================
            /// performance section
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 40.0,
                left: 15.0,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const Text(
                    'Performance',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ],
              ),
            ),

            ///=================================================================
            /// second section white container
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: FittedBox(
                            child: MySlider(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 3), //(x,y)
                                        blurRadius: 3,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  width: getProportionateScreenWidth(120),
                                  height: 50,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'this Month',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      RichText(
                                        text: const TextSpan(
                                          text: ' \$4.200 ',
                                          style: TextStyle(
                                            color: Color(0xffF2994A),
                                            fontSize: 12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' +8.2%',
                                              style: TextStyle(
                                                color: Color(0xff27AE60),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  width: getProportionateScreenWidth(120),
                                  height: 50,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Last Month',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      RichText(
                                        text: const TextSpan(
                                          text: ' \$4.050 ',
                                          style: TextStyle(
                                            color: Color(0xffF2994A),
                                            fontSize: 12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' +6.4%',
                                              style: TextStyle(
                                                color: Color(0xff27AE60),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///=====================================================
                        /// country's container
                        const SizedBox(height: 20.0),
                        CountryContainer(
                          title: 'Impression',
                          height: height,
                          label1: 'Europe',
                          labelColor1: Colors.green,
                          label2: 'America',
                          labelColor2: Colors.orange,
                          label3: 'Asia',
                          labelColor3: Colors.red,
                          label4: 'Africa',
                          labelColor4: Colors.brown,
                        ),
                        const SizedBox(height: 20.0),
                        CountryContainer(
                          title: 'Product Quality',
                          height: height,
                          label1: 'UI/UX',
                          labelColor1: Colors.green,
                          label2: 'Agile',
                          labelColor2: Colors.orange,
                          label3: 'Development',
                          labelColor3: Colors.red,
                          label4: 'Privacy',
                          labelColor4: Colors.brown,
                        ),
                      ],
                    ),
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
