
import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/company_widgets/edit_row.dart';
import 'package:cvito/company/company_layout/company_widgets/see_more_see_less.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabAboutUserScreen extends StatefulWidget {
  @override
  State<TabAboutUserScreen> createState() => _TabAboutUserScreenState();
}

class _TabAboutUserScreenState extends State<TabAboutUserScreen> {

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
                padding: const EdgeInsets.only(right:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditRow( label: 'About'),
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
                   const Text('CVs', style: TextStyle(color: kCustomBlack, fontSize: 20.0, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async{


                            },
                            child: Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Image.asset('assets/images/android_cv.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(20.0)),
                          InkWell(
                            onTap: () async{


                            },
                            child: Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Image.asset(
                                  'assets/images/ui_ux_cv.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


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

