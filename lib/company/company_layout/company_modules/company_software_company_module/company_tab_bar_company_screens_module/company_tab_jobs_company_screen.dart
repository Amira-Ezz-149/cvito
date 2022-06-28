import 'package:cvito/company/company_layout/company_modules/user_job_details_screen.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_widgets/edit_row.dart';

class CompanyTabJobsCompanyScreen extends StatelessWidget {
  const CompanyTabJobsCompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            EditRow(label: 'Opening Jobs', icon: Icons.edit, ),
           const SizedBox(height: 10,),
            BlocProvider(
            create: (context) => CVCubit(),
              child: BlocConsumer<CVCubit, CVStates>(
                listener: (context, state) {},
                builder: (context, state){
                  CVCubit cubit = CVCubit.get(context);
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:5,
                      itemBuilder: (context, index) {
                        return  ListTile(
                          trailing: IconButton(icon: const Icon(Icons.more_vert), onPressed: (){
                            navigateTo(context: context, widget: UserJobDetailsScreen());
                          },),
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
                            child: Image.asset(cubit.notificationsImageLinks[index]),
                          ),
                          tileColor: Colors.transparent,
                          title: Row(
                            children:  [
                              Text(
                               cubit.companyRelatedPeopleJobs[index],
                                style:const TextStyle(
                                    color: kCustomBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                          subtitle:  Text(
                            cubit.jobLocations[index],
                            style:const TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14.0),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10.0);
                      });
                },
              ),
              ),


          ],
        ),
      ),
    );
  }
}
