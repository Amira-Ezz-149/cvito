///لو في أي كود محتاجين نشيله على جمب علشان نتيست كود تاني ممكن نحطه هنا مؤقتًاimport 'dart:io';
import 'package:cvito/layout/widgets/default_form_field.dart';
import 'package:flutter/material.dart';

class UserJobsScreen extends StatelessWidget {
  TextEditingController relatedSearchController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> userJobRecommendationList = [
    "Web Designer",
    "Flutter Developer",
    "Backend Developer ",
    // "Android Developer",
    // "FullStack Developer",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          // maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        child: CircleAvatar(
                          radius: 25,
                          child: Image.asset('assets/images/profile_photo.png'),
                        ),
                        onTap: () {
                          print(
                              '====================================================');
                          //TODO IMPLEMENT THE FUNCTION HERE
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      );
                    }),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),

                    ///=================================================================================================
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
                const SizedBox(height: 30.0),

                ///================================================================================================
                /// Recommended For You
                const Text(
                  'Recommended For You',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                const SizedBox(height: 30.0),
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side:
                          const BorderSide(color: Colors.black45, width: 1),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),

                        leading: const  CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          AssetImage('assets/images/profile_photo.png'),
                        ),
                        // horizontalTitleGap: 5.0,
                        title:  Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(userJobRecommendationList[index]),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Software Company'),
                            Text('Cairo , Egypt(Remote)'),
                          ],
                        ),
                        trailing: const Icon(Icons.bookmark_border_outlined),

                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10.0);
                    },
                    itemCount: 3),

                ///================================================================================================
                /// Matched with your profile
                const SizedBox(height: 30.0),
                const Text(
                  'Matched with your profile',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



