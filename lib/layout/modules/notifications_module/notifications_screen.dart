import 'package:cvito/constants/constants.dart';
import 'package:cvito/layout/widgets/custom_list_tile_notifications.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_top_bar.dart';

/// padding = 15.0
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const CustomListTileNotifications();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      }),

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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const CustomListTileNotifications();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
