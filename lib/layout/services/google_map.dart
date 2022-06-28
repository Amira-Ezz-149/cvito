import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../not_use/basic_chat.dart';
import '../widgets/custom_button_with_text.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  var marker = HashSet<Marker>();
  final Completer<GoogleMapController> _Controler = Completer();
  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 14);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GoogleMap(
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
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                      )
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.60,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 26, right: 20, bottom: 59),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    color: const Color.fromRGBO(130, 130, 130, 1),
                                    width: 103,
                                    height: 3.72,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 19,right: 100,bottom: 16),
                                      child: SizedBox(
                                        width: 156,
                                        height: 35,
                                        child: Text(
                                          'Your employees',
                                          style: TextStyle(
                                              color: Color(0xff828282),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25,bottom: 16),
                                    child: CustomButtonWithIcon(
                                      color: const Color.fromRGBO(0, 119, 181, 1),
                                      onPressed: (){},
                                      size: 20,
                                      icon: Icons.arrow_forward_ios_outlined,
                                    ),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 0, left: 0),
                                child: Chats(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          });
        },
        markers: marker,
      ),
    );
  }

  Widget buildSheet() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: const BoxDecoration(
       borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26, right: 20, bottom: 59),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  color: const Color.fromRGBO(130, 130, 130, 1),
                  width: 103,
                  height: 3.72,
                ),
              ),
            ),
            Row(
              children: [
                 const Expanded(
                   child: Padding(
                     padding: EdgeInsets.only(left: 19,right: 100,bottom: 16),
                     child: SizedBox(
                       width: 156,
                       height: 35,
                       child: Text(
                         'Your employees',
                         style: TextStyle(
                             color: Color(0xff828282),
                             fontWeight: FontWeight.w500,
                             fontSize: 20),
                       ),
                     ),
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(right: 25,bottom: 16),
                  child: CustomButtonWithIcon(
                    color: const Color.fromRGBO(0, 119, 181, 1),
                    onPressed: (){},
                    size: 20,
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 0, left: 0),
              child: Chats(),
            ),
          ],
        ),
      ),
    );
  }
}
