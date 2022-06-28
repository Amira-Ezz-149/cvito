import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/custom_widgets/edit_row.dart';
import 'package:cvito/company/company_layout/custom_widgets/see_more_see_less.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserTabAboutCompanyScreen extends StatelessWidget {
  const UserTabAboutCompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  EditRow(label: 'About'),
                  buildText(
                      'We constantly strive to develop our unique talent pool and wealth of skills. Our company is constantly on the lookout for talented individuals who can make a valuable contribution to the success of our products. This is the only way to attain excellence: combining talent with relentless commitment to innovation.'),
                  const SizedBox(height: 20.0),

                  ///===========================================================
                  ///to align text in the cells of the table to left don't wrap TableRow to Column
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        textDirection: TextDirection.ltr,
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.bottom,
                        children: [
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Website',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: const Text(
                                  'Software123.com',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: kBasicColor,
                                  ),
                                ),
                                onTap: () {
                                  cubit.setLaunch();
                                },
                              ),
                            ),
                          ]),
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Company Size',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '200,000 employees',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                          ]),
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Founded',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '2008',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                          ]),
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'type',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Privately Held',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                          ]),
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Specialistes',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Talent Management, Online Recruitment, Human Resource Management Systems (HRMS), Online Occupational Technical and Psychometric Assessments, and Software Development',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Location',
                                style: TextStyle(color: kCustomBlack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Cairo, cairo, Zamalek',
                                    style: TextStyle(color: kCustomBlack),
                                  ),
                                const SizedBox(height: 5.0,),
                                  Row(
                                    children: const[
                                       Expanded(
                                        child: Text(
                                          'GET DIRECTIONS',
                                          style: TextStyle(color: kBasicColor, fontWeight: FontWeight.w500),
                                        ),
                                      ), Icon(Icons.login_outlined, color: kBasicColor,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
