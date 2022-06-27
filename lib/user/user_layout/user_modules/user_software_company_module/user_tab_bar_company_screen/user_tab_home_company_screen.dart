import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/company_modules/user_profile_module/user_profile_screen.dart';
import 'package:cvito/company/company_layout/company_widgets/edit_row.dart';
import 'package:cvito/company/company_layout/company_widgets/see_more_see_less.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserTabHomeCompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocProvider(
          create: (context) => CVCubit(),
          child: BlocConsumer<CVCubit, CVStates>(
            listener: (context, state) {},
            builder: (context, state) {
              CVCubit cubit = CVCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditRow( label: 'Home'),
                  buildText(
                      'a technology firm specialized in developing innovative web-based online employment marketplaces and platforms.'),
                  const SizedBox(height: 10.0),

                  ///================================================================================================
                  ///website link contact
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    height: 100,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border:
                            Border.all(color: Colors.grey.shade400, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Website',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0),
                        ),

                        // CVCubit cubit = CVCubit();
                        Expanded(
                          child: TextButton(
                            child: const Text(
                              'Software123.com',
                              style: TextStyle(color: kBasicColor),
                            ),
                            onPressed: () {
                              cubit.setLaunch();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  EditRow(label: 'Opening Jobs'),

                  ///==============================================================================================
                  /// jobs sections list view builder ....vertical

                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cubit.jobsNames.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            navigateTo(
                                context: context,
                                widget: UserProfileScreen(
                                  jobTitle: cubit.jobsNames[index],
                                  jobLocation: cubit.jobLocations[index],
                                ));
                          },
                          child: ListTile(
                            // trailing: const Icon(Icons.edit),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 5, 16, 5),
                            dense: true,
                            isThreeLine: true,
                            leading: CircleAvatar(
                              radius: 30,
                              child: Image.asset(
                                  cubit.UserImageLinks[index]),
                            ),
                            tileColor: Colors.transparent,
                            title: Row(
                              children: [
                                Text(
                                  cubit.jobsNames[index],
                                  style: const TextStyle(
                                      color: kCustomBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              cubit.jobLocations[index],
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10.0);
                      }),
                  const SizedBox(height: 10.0),
                  const Text('Your Employees',
                      style: TextStyle(fontSize: 20.0)),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    height: getProportionateScreenHeight(90),

                    ///==========================================================================================================
                    /// Your Employees list view builder ....horizontal
                    child: Center(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Column(
                              children:  [
                                CircleAvatar(
                                  child: Image(
                                      image: AssetImage(
                                          cubit.notificationsImageLinks[index])),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                 cubit.UserChatUsers[index]
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 20.0);
                          }),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Center(
                      child: Text(
                    'Your Rating From Applicants Or Others',
                    style: TextStyle(
                        color: kCustomBlack,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  )),
                  const SizedBox(height: 10.0),

                  Center(
                      child: Text(
                    'Your review :  ${cubit.rating}',
                    style: const TextStyle(fontSize: 15.0),
                  )),

                  const SizedBox(height: 15.0),

                  Center(
                    child: RatingBar.builder(
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 7.0),
                        itemSize: 30,
                        updateOnDrag: true,
                        glowColor: Colors.white60,
                        unratedColor: const Color(0xffE0E0E0),
                        minRating: 1,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (rating) {
                          cubit.ratingUpdate(rating);
                        }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
