import 'package:cvito/constants/constants.dart';
import 'package:cvito/cubit/cubit.dart';
import 'package:cvito/cubit/states.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/widgets/company_card.dart';
import 'package:cvito/layout/widgets/default_form_field.dart';
import 'package:cvito/layout/widgets/suggested_people_list_tile.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedScreen extends StatelessWidget {
  const RelatedScreen({Key? key}) : super(key: key);

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
                              context: context, widget: const LayoutScreen());
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
                  children: [
                    const Text(
                      'Top Companies',
                      style: TextStyle(
                          color: kCustomBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text('see all'))
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
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const SuggestedPeopleListTile();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
