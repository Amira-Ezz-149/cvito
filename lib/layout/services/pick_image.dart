import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import 'image_controller.dart';

class PickImage extends GetView<ImageController> {
  const PickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => CircleAvatar(
            radius: 135,
            child: controller.selectedImagePath.value != ''
                ? CircleAvatar(
                    radius: 135,
                    backgroundImage:
                        FileImage(File((controller.selectedImagePath.value))),
                  )
                : const CircleAvatar(
                    radius: 135,
                    backgroundImage: AssetImage(
                      'assets/images/login_user_icon.png',
                    ),
                  ))),
        Positioned(
          bottom: -10,
          right: -25,
          child: CustomButtonWithIcon(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return SafeArea(
                          child: SizedBox(
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text("photo from gallery"),
                              onTap: () {
                                controller.pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: const Text("photo from camera"),
                              onTap: () {
                                controller.pickImage(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text("delete photo"),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ));
                    });
              },
              color: kBasicColor,
              icon: Icons.add_a_photo,
              size: 35),
        ),
      ],
    );
  }
}
