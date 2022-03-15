import 'dart:ui';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/cubit/cubit.dart';
import 'package:cvito/cubit/states.dart';
import 'package:cvito/layout/widgets/edit_row.dart';
import 'package:cvito/layout/widgets/see_more_see_less.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabAboutUserScreen extends StatelessWidget {


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
                padding: const EdgeInsets.only(right:15.0),
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
                   const Text('CVs', style: TextStyle(color: kCustomBlack, fontSize: 20.0, fontWeight: FontWeight.w500),),


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


//
// ///=============================================================================
// ///edit row which has label and edit icon
// class EditRow extends StatelessWidget {
//   IconData icon;
//   String label;
//
//   EditRow({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//               color: kCustomBlack,
//               fontSize: 18.0,
//               decorationColor: kCustomBlack,
//               fontWeight: FontWeight.w400),
//         ),
//         const Spacer(),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(
//             icon,
//             color: kCustomBlack,
//           ),
//         )
//       ],
//     );
//   }
// }