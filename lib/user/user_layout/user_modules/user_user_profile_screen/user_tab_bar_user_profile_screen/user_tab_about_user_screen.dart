import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/cubit/cubit.dart';
import 'package:cvito/cubit/states.dart';
import 'package:cvito/layout/widgets/edit_row.dart';
import 'package:cvito/layout/widgets/see_more_see_less.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTabAboutUserScreen extends StatelessWidget {
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
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditRow(icon: Icons.edit, label: 'About'),
                    buildText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam suspendisse aliquet platea ut ornare porttitor. Adipiscing tellus volutpat laoreet erat consectetur cum suscipit ac. Tellus nibh semper ornare suspendisse lectus arcu elit, pellentesque. Fusce ipsum sem ut tortor.'),
                    const SizedBox(height: 10.0),

                    ///===========================================================
                    ///Email link contact
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                      height: 100,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Colors.grey.shade400, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Email',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0),
                          ),

                          // CVCubit cubit = CVCubit();
                          Expanded(
                            child: TextButton(
                              child: const Text(
                                'miraezz14@gmail.com',
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

                    ///=================================================================
                    /// jobs sections
                    SizedBox(height: getProportionateScreenHeight(30.0)),
                    const Text(
                      'CVs',
                      style: TextStyle(
                          color: kCustomBlack,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 15.0,),




                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.topCenter,
                              // width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(color: kBasicColor.withOpacity(.5),
                                 ),
                              child:   Image.asset('assets/images/cvs1.png', fit: BoxFit.cover,)
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.topCenter,
                              // width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 3.5,
                              decoration: BoxDecoration(color: kBasicColor.withOpacity(.5),
                               ),
                              child: Image.asset(
                                'assets/images/cvs2.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20.0,),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
