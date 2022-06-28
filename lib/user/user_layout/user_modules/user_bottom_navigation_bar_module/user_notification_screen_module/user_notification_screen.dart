import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/company/company_layout/custom_widgets/custom_list_tile_notifications.dart';
import 'package:cvito/company/company_layout/custom_widgets/custom_top_bar.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/user/user_layout/user_modules/user_user_profile_screen/user_user_profile_screen.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNotificationsScreen extends StatelessWidget {
  const UserNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: kBasicColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///===========================================================
                  /// notification section
                  CustomTopBar(
                    imageLink: 'assets/images/profile_photo.png',
                    title: 'Notifications',
                    color: Colors.white,
                  function: () {
                    navigateTo(
                        context: context,
                        widget: UserUserProfileScreen(
                          jobTitle: 'Web Development',
                          jobLocation: 'Cairo - Egypt',

                        ));
                  },
                ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                    child: Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  ///=============================================================
                  /// Today notifications
                  BlocProvider(
                    create: (BuildContext context)=>CVCubit(),
                    child: BlocConsumer<CVCubit, CVStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        CVCubit cubit = CVCubit.get(context);
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return  CustomListTileNotifications(notificationTime: cubit.UserChatTimes[index],notificationImages: cubit.notificationsImageLinks[index] ,);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                            });
                      },
                    ),
                    ),



                  ///===========================================================
                  ///Yesterday text
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Yesterday',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  ///===========================================================
                  /// Yesterday notifications
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return  CustomListTileNotifications(notificationTime: '7:00 AM', notificationImages: 'assets/images/person1.png',);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      }),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
