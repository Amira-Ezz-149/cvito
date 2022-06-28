import 'package:flutter/material.dart';
import '../widgets/constants_color.dart';
import '../widgets/text_field_search.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,right: 16),
                child: Row(
                  children: [
                    IconButton(
                        color: kGrayColor,
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back)),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    Expanded(
                      child: textFormField(
                          radious: 3,
                          controller: TextEditingController(),
                          type: TextInputType.text,
                          onChanged: () {},
                          hint: "Search",
                          color: kBoxColor,
                        //prefix: Icons.search
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60,left: 16,right: 16),
                child: SizedBox(width:328,height: 400,child: Image.asset("assets/images/profile.png",)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
