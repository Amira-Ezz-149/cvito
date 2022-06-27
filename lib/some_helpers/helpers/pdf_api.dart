// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
//
// class PDFApi{
//   static Future <File> loadFirebase(String url) async{
//     final refPdf = FirebaseStorage.instance.ref().child(url);
//     final bytes = await refPdf.getData();
//     return _storeFile(url, bytes!);
//   }
//
//
//
//   static Future<File> _storeFile(String url, List<int> bytes) async {
//     String filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();
//
//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     return file;
//   }
// }