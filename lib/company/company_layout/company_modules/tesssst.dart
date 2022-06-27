import 'package:flutter/material.dart';

//////لو في أي كود محتاجين نشيله على جمب علشان نتيست كود تاني ممكن نحطه هنا مؤقتًاimport 'dart:io';
/*
import 'package:cvito/company_layout/company_widgets/default_form_field.dart';
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



*/

//user home screen
/*

onTap: () {
print(
'====================================================');
//TODO IMPLEMENT THE FUNCTION HERE
_scaffoldKey.currentState?.openDrawer();
},*/


// الكود الاصلي
/*

//user user profile screen

import 'dart:io';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/company_layout/company_widgets/basic_custom_button.dart';
import 'package:cvito/company_layout/company_widgets/transparent_icon.dart';
import 'package:cvito/user/user_layout/user_layout.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_tab_bar_user_profile_screen/user_tab_about_user_screen.dart';
import 'user_tab_bar_user_profile_screen/user_tab_education_user_screen.dart';
import 'user_tab_bar_user_profile_screen/user_tab_experience_user_screen.dart';

/// for multi provider TickerProviderStateMixin
/// for single provider SingleTickerProviderStateMixin

class UserUserProfileScreen extends StatefulWidget {
  @override
  State<UserUserProfileScreen> createState() => _UserUserProfileScreenState();
  String jobTitle;
  String jobLocation;

  UserUserProfileScreen({required this.jobTitle, required this.jobLocation});
}

class _UserUserProfileScreenState extends State<UserUserProfileScreen>
    with TickerProviderStateMixin {
  File? profileImage;
  File? backgroundImage;
  String? imagePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }



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
                                navigateTo(context: context, widget: const UserLayoutScreen());
                              },
                            ),
                            TransparentIcon(
                              icon: Icons.edit,
                              onPressed: () {
                                //todo calling backgroundImage
                                pickImage().then((value) {
                                  if(value != null) debugPrint('finish');
                                  debugPrint(value.toString());
                                  setState(() {
                                    backgroundImage = value;
                                  });
                                });
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
                                      : const FlutterLogo(size: 100),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -5,
                            bottom: 15,
                            child: GestureDetector(
                              onTap: () {
                                //todo calling profileImage
                                debugPrint('onClick');
                                pickImage().then((value) {
                                  if(value != null) debugPrint('finish');
                                  debugPrint(value.toString());
                                  setState(() {
                                    profileImage = value;
                                  });
                                } );
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: ElevatedButton(
                  onPressed: (){
                    saveImage(path: profileImage!.path);





                  },
                  child: const Text('save'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: kBasicColor,
                    onSurface: Colors.grey,
                    side: const BorderSide(color: kBasicColor, width: 1),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
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
                    const Text('Eyad Najy ',
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
                        UserTabAboutUserScreen(),
                        UserTabExperienceUserScreen(),
                        UserTabEducationUserScreen(),
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

  void saveImage({required path}) async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('imagePath', path);
  }

  void loadImage() async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      imagePath =  saveImage.getString('imagePath');
    });
  }
}

*/


//كود مع السيركل افاتار بس عندي 3 شروط فيهم
/*

child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
imagePath != null
? CircleAvatar(
backgroundImage:
FileImage(File(imagePath!)),radius: 80.0,
)
: ClipOval(
child: profileImage != null
? Image.file(
profileImage!,
width: 160,
height:
getProportionateScreenHeight(
170),
fit: BoxFit.cover,
)
: const FlutterLogo(size: 100),
),
],
),
*/

//كود مش بيحفظ الصورة
/*

Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
imagePath != null  ? ClipOval(
child: profileImage != null
? Image.file(
profileImage!,
width: 160,
height:
getProportionateScreenHeight(
170),
fit: BoxFit.cover,
)
: const FlutterLogo(size: 100),
) : CircleAvatar(
backgroundImage:
FileImage(File(imagePath!)),radius: 80.0,
),
],
),
*/


/*

child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
imagePath != null
? CircleAvatar(
backgroundImage:
FileImage(File(imagePath!)),radius: 80.0,
)
: ClipOval(
child: profileImage != null
? Image.file(
profileImage!,
width: 160,
height:
getProportionateScreenHeight(
170),
fit: BoxFit.cover,
)
:  Image.asset('assets/images/user_profile_image.jpeg'),
),
],
),
*/



class SearchTest extends StatefulWidget {


  @override
  State<SearchTest> createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {

  ///empty String list
  var items = <String>[];
  TextEditingController editingController = TextEditingController();
  // final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  List<String> duplicateItems =['a', 'aa', 'aaa', 'aaaa', 'aaaaa'];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      for (var item in dummySearchList) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text('Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

