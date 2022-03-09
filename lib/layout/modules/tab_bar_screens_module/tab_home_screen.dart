import 'dart:ui';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/cubit/cubit.dart';
import 'package:cvito/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import '../../../constants/sized_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TabHomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: BlocProvider(
          create: (context) => CVCubit(),
          child: BlocConsumer<CVCubit, CVStates>(
            listener: (context, state){},
            builder: (context, state){
              CVCubit cubit = CVCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditRow(icon: Icons.edit, label: 'About'),
                  buildText(
                      'We constantly strive to develop our unique talent pool and wealth of skills. Our company is constantly on the lookout for talented individuals who can make a valuable contribution to the success of our products. This is the only way to attain excellence: combining talent with relentless commitment to innovation.'),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    height: 100,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey.shade400, width: 1)),
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
                        )

                      ],
                    ),
                  ),
                  EditRow(icon: Icons.edit, label: 'Openning Jobs'),

                  ///=================================================================
                  /// jobs sections

                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const CustomListTileJob();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10.0);
                      }),
                  const SizedBox(height: 10.0),
                  const Text('Your Employees', style: TextStyle(fontSize: 20.0)),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    height: getProportionateScreenHeight(90),

                    ///===============================================================
                    /// Your Employees list view builder
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: const [
                              CircleAvatar(
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/profile_photo.png')),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Najy',
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20.0,
                          );
                        }),
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
                        itemPadding: const EdgeInsets.symmetric(horizontal: 7.0),
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

  ///===========================================================================
  /// see more
  Widget buildTextButton(
      {required String text, required VoidCallback onClicked}) {
    return TextButton(onPressed: onClicked, child: Text(text));
  }

  Widget buildText(String text) {
    return ReadMoreText(
      text,
      trimCollapsedText: 'see more',
      trimExpandedText: 'see less',
      trimLength: 100,
      trimMode: TrimMode.Length,
      delimiterStyle: const TextStyle(color: kBasicColor),
      moreStyle:
          const TextStyle(color: kBasicColor, fontWeight: FontWeight.w500),
      lessStyle:
          const TextStyle(color: kBasicColor, fontWeight: FontWeight.w500),
      style: const TextStyle(fontSize: 15),
    );
  }
}

class CustomListTileJob extends StatelessWidget {
  const CustomListTileJob({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
  }
}

///=============================================================================
///edit row which has label and edit icon
class EditRow extends StatelessWidget {
  IconData icon;
  String label;

  EditRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
              color: kCustomBlack,
              fontSize: 18.0,
              decorationColor: kCustomBlack,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: kCustomBlack,
          ),
        )
      ],
    );
  }
}
