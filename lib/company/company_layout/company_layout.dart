import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyLayoutScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';

  const CompanyLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CVCubit(),
        child: BlocConsumer<CVCubit, CVStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = CVCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: cubit.screens[cubit.currentBottomIndex],
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: const Color(0xff828282),
                selectedItemColor: kBasicColor,
                currentIndex: cubit.currentBottomIndex,
                onTap: (int value) {
                  cubit.changeBottomNavBarIndex(value);
                },
                type: BottomNavigationBarType.fixed,
                items: cubit.bottomItems,
              ),
            );
          },
        ));
  }
}