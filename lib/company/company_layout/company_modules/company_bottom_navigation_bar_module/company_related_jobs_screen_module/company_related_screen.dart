import 'dart:io';

import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/company_layout.dart';
import 'package:cvito/company/company_layout/custom_widgets/company_card.dart';
import 'package:cvito/company/company_layout/custom_widgets/default_form_field.dart';
import 'package:cvito/company/company_layout/custom_widgets/suggested_people_list_tile.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRelatedScreen extends StatelessWidget {
  const CompanyRelatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController relatedSearchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        color: kBasicColor,
                        onPressed: () {
                          navigateTo(
                              context: context, widget: const CompanyLayoutScreen());
                        },
                        icon: const Icon(Icons.arrow_back)),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),

                    ///==========================================================
                    ///search bar
                    Expanded(
                      child: defaultTextFormField(
                          controller: relatedSearchController,
                          type: TextInputType.text,
                          onChanged: () {},
                          label: "Search",
                          prefix: Icons.search),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),

                ///=========================================================
                ///see all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const[
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Top Companies',
                        style: TextStyle(
                            color: kCustomBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    // TextButton(onPressed: () {}, child: const Text('see all'))
                  ],
                ),
                const SizedBox(height: 10.0),

                ///=============================================================
                ///Companies list view
                BlocProvider(
                  create: (context) => CVCubit(),
                  child: BlocConsumer<CVCubit, CVStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      CVCubit cubit = CVCubit();
                      return SizedBox(
                        height: 100,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.companiesLogos.length,
                          itemBuilder: (context, index) => CompanyCard(
                            logoScale: index == 0 ? 1 : 2,
                            imageLink: cubit.companiesLogos[index],
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 10.0);
                          },
                        ),
                      );
                    },
                  ),
                ),

                ///=============================================================
                ///related people you might know
                const SizedBox(height: 15.0),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  child: Text(
                    'people related to you',
                    style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => CVCubit(),
                 child: BlocConsumer<CVCubit, CVStates>(
                   listener: (context, state) {},
                   builder: (context, state){
                     CVCubit cubit = CVCubit.get(context);
                     return ListView.separated(
                         physics: const BouncingScrollPhysics(),
                         shrinkWrap: true,
                         scrollDirection: Axis.vertical,
                         itemCount: 6,
                         itemBuilder: (context, index) {
                           return  SuggestedPeopleListTile(
                             relatedPeopleImages: cubit.UserImageLinks[index] ,
                             relatedPeopleName: cubit.companyRelatedPeopleNames[index],
                             relatedPeopleJobTitle: cubit.companyRelatedPeopleJobs[index],
                           );
                         },
                         separatorBuilder: (context, index) {
                           return const SizedBox();
                         });
                   },
                 ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
