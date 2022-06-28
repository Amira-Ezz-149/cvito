import 'dart:async';
import 'dart:collection';
import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:cvito/layout/Home_Screen/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../not_use/basic_chat.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/custom_button_with_text.dart';
class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var marker = HashSet<Marker>();
  final Completer<GoogleMapController> _Controler = Completer();
  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        _Controler.complete(controller);
                        setState(() {
                          marker.add(
                            Marker(
                              markerId: const MarkerId('1'),
                              position: const LatLng(30.033333, 31.233334),
                              infoWindow: const InfoWindow(
                                title: 'Company',
                              ),
                              onTap: () {},
                            ),
                          );
                        });
                      },
                      markers: marker,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 294),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        width: 50,
                        height: 50,
                        child: CustomButtonWithIcon(
                            color: kBasicColor,
                            icon: Icons.search,
                            size: 25,
                            onPressed: () {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 294),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        width: 50,
                        height: 50,
                        child: CustomButtonWithIcon(
                            color: kBasicColor,
                            icon: Icons.question_mark_sharp,
                            size: 30,
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.65,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(24),
                                            topLeft: Radius.circular(24))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 19),
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            physics: const BouncingScrollPhysics(),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 26,),
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(30.0),
                                                  child: Container(color: kGrayColor130, width: 103, height: 3.72,),
                                                ),
                                                const SizedBox(height: 40,),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: text(
                                                          size: 20,
                                                          text: 'Your employees',
                                                          colors: kGrayColor,
                                                          fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    CustomButtonWithIcon(
                                                      color: kBasicColor,
                                                      onPressed: () {},
                                                      size: 20,
                                                      icon: Icons.arrow_forward_ios_outlined,
                                                    )
                                                  ],
                                                ),
                                                Chats(),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: text(
                                                  size: 18,
                                                  text: 'Contacts',
                                                  colors: kGrayColor130,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              CustomButtonWithIcon(
                                                color: kBasicColor,
                                                onPressed: () {
                                                  Get.off(Contacts());
                                                },
                                                size: 25,
                                                icon: Icons.create_sharp,
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 20,),
                                          Row(
                                            children: [],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                      ),
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
}
