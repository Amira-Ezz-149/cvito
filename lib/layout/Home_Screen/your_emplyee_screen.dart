import 'package:cvito/layout/not_use/conversition_person.dart';
import 'package:cvito/layout/widgets/tob_bar_search.dart';
import 'package:flutter/material.dart';
import '../widgets/lists.dart';

class YourEmployee extends StatefulWidget {
  const YourEmployee({Key? key}) : super(key: key);

  @override
  _YourEmployeeState createState() => _YourEmployeeState();
}

class _YourEmployeeState extends State<YourEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TobBarSearch(),
                    const Padding(
                      padding: EdgeInsets.only(top: 25,bottom: 15,left: 16,right: 180),
                      child: SizedBox(
                        width: 151,
                        height: 33,
                        child: Text(
                          'Your employees',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0,left:0),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Conversitionperson(jobss: jobs[index],name: names[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          }
                      ),)
                  ],
                )],
            ),
          ),
        ));
  }
}