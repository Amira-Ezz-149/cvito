import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = "".obs;
  void pickImage(ImageSource imageSource) async {
    final pickImage = await ImagePicker().pickImage(source: imageSource);
    if (pickImage != null) {
      selectedImagePath.value = pickImage.path;
    } else {
      Get.snackbar("Error", "No image Selected",
          duration: const Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
class UploadImageController extends GetxController{
  XFile? imagePath;
  void uploadImage()async {
   FirebaseFirestore firebaseFirestore =  FirebaseFirestore.instance;
   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    var uniqueKey = firebaseFirestore.collection("users");
    String uploadFileName = DateTime.now().millisecondsSinceEpoch.toString()+'.jpg';
    Reference reference =firebaseStorage.ref().child("users").child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) { 
      print(event.bytesTransferred.toString() + "\t" + event.totalBytes.toString());
    });
    await uploadTask.whenComplete(()async{
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if(uploadPath.isNotEmpty){
      firebaseFirestore.collection("users").doc(uniqueKey.id).set({
        'image':uploadPath
      }).then((value){
        print(uploadPath);
      });
    }else{
        print("fail");
      }
    }
    );
  }
}

