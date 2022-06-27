import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/company/company_layout/company_modules/performance_screen.dart';
import 'package:cvito/company/company_layout/company_modules/software_company_module/software_company_screen.dart';
import 'package:cvito/company/company_layout/company_widgets/custom_card.dart';
import 'package:cvito/company/company_layout/company_widgets/default_form_field.dart';
import 'package:cvito/company/company_layout/company_widgets/line_chart_widget.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        backgroundColor: kBasicColor,
                        radius: 25,
                        backgroundImage:
                        AssetImage('assets/images/company.png' ),
                      ),
            // assets/images/requirements.png
                      onTap: (){
                        navigateTo(context: context, widget: SoftwareCompanyScreen());
                        print('Company');
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),

                    ///==========================================================
                    ///search bar
                    Expanded(
                      child: defaultTextFormField(
                          controller: searchController,
                          type: TextInputType.text,
                          onChanged: () {},
                          label: "Search",
                          prefix: Icons.search),
                    ),
                  ],
                ),
                // Spacer(),

                ///==============================================================
                /// dashboard text
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),

                ///==============================================================
                ///cards
                Row(
                  children: [
                     CustomCard(imageLink: 'assets/images/card1.png'),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                     CustomCard(imageLink: 'assets/images/requirements.png')
                  ],
                ),

                ///=============================================================
                ///job description container
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    width: SizeConfig.screenWidth,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Job Applicants',
                              style: TextStyle(color: kCustomBlack, fontWeight: FontWeight.w700, fontSize: 15.0),
                            ),
                            SizedBox(height:5.0 ,),
                            Text(
                              "See your job applicants here! \nApplicants CVs Matched With Your Job.",
                              style: TextStyle(color: kCustomBlack, fontWeight: FontWeight.w400, fontSize: 11.0),
                            ),
                          ],
                        ),
                        SizedBox(width: getProportionateScreenWidth(10),),
                        const Expanded(child: Image(image: AssetImage('assets/images/job_applicants.png',),))
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),

                ///==============================================================
                ///Row of        ...Results, view details
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Rank',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            navigateTo(
                                context: context, widget: PerformanceScreen());
                          },
                          child: const Icon(Icons.arrow_forward_ios_sharp))
                    ],
                  ),
                ),

                ///==============================================================
                ///Rating Graph
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: LineChartWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
