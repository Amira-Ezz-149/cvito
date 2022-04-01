import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/widgets/custom_card.dart';
import 'package:cvito/layout/widgets/default_form_field.dart';
import 'package:cvito/user/user_layout/user_modules/user_create_cv_module/user_create_cv_screen.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';


class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBasicColor,
        onPressed: () {
          showModalBottomSheet(

            enableDrag: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              context: context,
              builder: (context) => buildSheet(context));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
                      child: CircleAvatar(
                        radius: 25,
                        child: Image.asset('assets/images/rafiki.png'),
                      ),
                      onTap: () {
                        //TODO IMPLEMENT THE FUNCTION HERE
                      },
                    ),
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
                // Spacer(),

                ///=================================================================================================
                /// Create a job-Winning text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    width: SizeConfig.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Create a job-Winning \nResume in minutes!.",
                              style: TextStyle(
                                  color: kCustomBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Expanded(
                            child: Image(
                          image: AssetImage(
                            'assets/images/create job winning.png',
                          ),
                          height: 70,
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),

                ///=================================================================================================
                ///cards
                Row(
                  children: [
                     CustomCard(
                        imageLink: 'assets/images/create_your_cv.png',
                       function: (){
                          navigateTo(context: context, widget: const UserCreateCVScreen());
                       },
                     ),

                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                     CustomCard(
                        imageLink: 'assets/images/edit_your_extend_cv.png')
                  ],
                ),

                ///=================================================================================================
                ///Row of        ...Recent, arrow
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Recent',
                        style: TextStyle(
                            color: kCustomBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            //TODO IMPLEMENT THE FUNCTION HERE
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: kBasicColor,
                          ))
                    ],
                  ),
                ),

                ///=================================================================================================
                ///cvs
                Row(
                  children: [
                    Container(
                      width: 160,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    const Spacer(),
                    Container(
                      width: 160,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget buildSheet(BuildContext context)=>Container(
padding: const EdgeInsets.only(left: 40.0),
   height: MediaQuery.of(context).size.height/3,
   child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.end,
     children: [
      const Spacer(),
       BottomSheetRow(icon: Icons.download, iconLabel: 'Download', function: () { debugPrint('download'); },),
      const Spacer(),
       BottomSheetRow(icon: Icons.share_outlined, iconLabel: 'Share', function: () {  debugPrint('share');},),
      const Spacer(),
       BottomSheetRow(icon: Icons.delete, iconLabel: 'Delete', function: () { debugPrint('delete'); },),
      const Spacer(),
     ],
   ),
 );

}

class BottomSheetRow extends StatelessWidget {
 IconData? icon;
 String? iconLabel;
 VoidCallback? function;
 BottomSheetRow({required this.icon, required this.iconLabel, required this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO IMPLEMENT THIS FUNCTION HERE
      onTap:function,

      child: Row(children: [
        Icon(icon, size: 20.0,),
       const SizedBox(width: 30.0,),
        Text(iconLabel!, style: const TextStyle(fontSize: 20.0),),
      ],),
    );
  }

}
