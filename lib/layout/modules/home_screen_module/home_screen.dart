import 'package:cvito/layout/widgets/custom_card.dart';
import 'package:cvito/layout/widgets/default_form_field.dart';
import 'package:cvito/layout/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('assets/images/rafiki.png'),
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
                    const CustomCard(imageLink: 'assets/images/card1.png'),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    const CustomCard(imageLink: 'assets/images/card1.png')
                  ],
                ),

                ///==============================================================
                ///Row of        ...Results, view details
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Results',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {}, child: const Text('view details >'))
                    ],
                  ),
                ),

                ///==============================================================
                ///Rating Graph
                Container(
                  color: Colors.white,
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
