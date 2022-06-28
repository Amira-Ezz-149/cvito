import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class GeoLocation{
  Future<Position> getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
class ApplicationBloc with ChangeNotifier{
  final GeolocatorService = GeoLocation();
  Position? CurrentLocation;
  ApplicationBloc(){
    setCurrentLocation();
  }
  setCurrentLocation() async {
    CurrentLocation = await GeolocatorService.getCurrentLocation();
    notifyListeners();
  }
}