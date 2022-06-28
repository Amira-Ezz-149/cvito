import 'package:cvito/company/company_layout/custom_widgets/basic_custom_button.dart';
import 'package:cvito/company/company_layout/custom_widgets/intro_slider.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/some_helpers/start_modules/get_started_module/get_started_screen.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(create: (BuildContext context)=>CVCubit(),
    child: BlocConsumer<CVCubit, CVStates>(
      listener: (context, state) {},
      builder: (context, state) {

        ///cubit instance in builder of BlocProvider
        CVCubit cubit = CVCubit.get(context);
        return Scaffold(
          ///white60
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (value) {
                        cubit.changeCurrentPage(value);
                      },
                      itemCount: cubit.welcomeImages.length,
                      itemBuilder: (context, index) => IntroSliderContent(
                        title: cubit.welcomeImages[index]['title'],
                        description: cubit.welcomeImages[index]['description'],
                        imageLink: cubit.welcomeImages[index]['image'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          const Spacer(),

                          ///===============================================
                          ///swapping between images
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              cubit.welcomeImages.length,

                              ///============================================
                              ///slider
                                  (index) => cubit.buildDot(
                                index: index,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),

                          ///=================================================
                          /// start button
                          SizedBox(
                            child: BasicCustomButton(
                                text: 'Start',
                                function: () {
                                  navigateTo(
                                      context: context, widget: const GetStartedScreen());
                                }),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }


}
