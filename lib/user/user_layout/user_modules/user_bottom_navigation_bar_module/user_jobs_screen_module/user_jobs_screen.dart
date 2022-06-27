import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/company_widgets/default_form_field.dart';
import 'package:cvito/user/user_layout/user_modules/user_job_details_screen.dart';
import 'package:cvito/user/user_layout/user_modules/user_software_company_module/user_software_company_screen.dart';
import 'package:cvito/user/user_layout/user_modules/user_user_profile_screen/user_user_profile_screen.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserJobsScreen extends StatelessWidget {
  TextEditingController relatedSearchController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                            navigateTo(context: context, widget: UserUserProfileScreen(jobTitle: 'Web Development', jobLocation: 'Cairo - Egypt'));
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
                const SizedBox(height: 35.0),

                ///=====================================================================================================
                /// Recommended For You
                const Text(
                  'Recommended For You',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                const SizedBox(height: 15.0),
                BlocProvider(
                    create: (BuildContext context) => CVCubit(),
                    child: BlocConsumer<CVCubit, CVStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        CVCubit cubit = CVCubit.get(context);
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(
                                      color: Colors.black45, width: 1),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 5.0),

                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      cubit.notificationsImageLinks[index]),
                                ),
                                // horizontalTitleGap: 5.0,
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: InkWell(
                                    onTap: (){
                                      navigateTo(context: context, widget: UserJobDetailsScreen(jobTitle: cubit.userJobRecommendationList[index],));
                                    },
                                    child: Text(
                                        cubit.userJobRecommendationList[index]),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     InkWell(   onTap: (){
                                      navigateTo(context: context, widget: UserSoftwareCompanyScreen());
                                    },
                                        child: const Text('Software Company')),
                                    Text(
                                        cubit.userJobsLocationList[index]),
                                  ],
                                ),
                                // trailing:
                                //     const Icon(Icons.bookmark_border_outlined),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 10.0);
                            },
                            itemCount: 3);
                      },
                    )),

                ///================================================================================================
                /// Matched with your profile
                const SizedBox(height: 35.0),
                const Text(
                  'Matched with your profile',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                const SizedBox(height: 15.0),
                BlocProvider(
                    create: (BuildContext context) => CVCubit(),
                    child: BlocConsumer<CVCubit, CVStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        CVCubit cubit = CVCubit.get(context);
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(
                                      color: Colors.black45, width: 1),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 5.0),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      cubit.UserImageLinks[index]),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                      cubit.userJobRecommendationList[index]),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Software Company'),
                                    Text(
                                        cubit.userJobsLocationList[index]),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: [
                                           Container(
                                             // color: Colors.amber,
                                             padding: const EdgeInsets.all(5.0),
                                             child: Stack(
                                               children: const[
                                                  CircleAvatar(
                                                  radius: 15,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile_photo.png'),
                                          ),
                                                 Positioned(
                                                     bottom: -1.0,
                                                     right: -1.0,
                                                     child: Icon(Icons.check_circle, size: 9.0, color: Colors.green, ))
                                               ],
                                             ),
                                           ),
                                          const SizedBox(width: 5.0,),
                                          const Expanded(
                                              child: Text(
                                                'Your profile matches this job',
                                                style: TextStyle(
                                                    fontSize: 12.0, ),
                                                maxLines: 2,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // trailing:
                                //     const Icon(Icons.bookmark_border_outlined),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 10.0);
                            },
                            itemCount: 3);
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
