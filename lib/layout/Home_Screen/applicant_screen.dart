import 'package:cvito/layout/widgets/lists.dart';
import 'package:flutter/material.dart';
import '../widgets/constants_color.dart';
import '../widgets/applicant_list_tile_widget.dart';
import '../widgets/custom_tob_bar_widget.dart';
class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //bar
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 16,right: 16,bottom: 38),
                child: CustomTopBar(
                    title: "Applicants",
                    imageLink: 'assets/images/unsplash.png',
                    color: kGrayColor),
              ),
              ListView.separated(itemBuilder: (context,index){
                return ApplicantListTile(jobss:jobs[index],location: locations[index],name: names[index],);
              }, separatorBuilder: (context,index){
                return const SizedBox();
              },
                itemCount: names.length,
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
