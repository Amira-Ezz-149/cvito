import 'package:cvito/layout/services/signin_controller.dart';
import 'package:cvito/layout/services/signup_controller.dart';
import 'package:get/get.dart';
import 'image_controller.dart';


class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<ImageController>(() => ImageController());
  }

}