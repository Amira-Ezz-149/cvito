import 'package:cvito/layout/widgets/edit_row.dart';
import 'package:flutter/material.dart';
import 'package:cvito/constants/constants.dart';


class UserTabJobsCompanyScreen extends StatelessWidget {
  const UserTabJobsCompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            EditRow(label: 'Opening Jobs', icon: Icons.edit, ),
            const SizedBox(height: 10,),
            ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:5,
                itemBuilder: (context, index) {
                  return  ListTile(
                    trailing: const Icon(Icons.edit),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    dense: true,
                    isThreeLine: true,
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/profile_photo.png'),
                    ),
                    tileColor: Colors.transparent,
                    title: Row(
                      children: const [
                        Text(
                          'Web Designer',
                          style: TextStyle(
                              color: kCustomBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    subtitle: const Text(
                      'Cairo, Cairo , Egypt',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10.0);
                }),

          ],
        ),
      ),
    );
  }
}
