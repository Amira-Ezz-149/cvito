import 'package:cvito/user/user_layout/user_layout.dart';
import 'package:cvito/user/user_layout/user_modules/user_create_cv_module/building_manual_cv/my_text_field.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'template_model.dart';

class CreateTemplate extends StatefulWidget {
  @override
  State<CreateTemplate> createState() => _CreateTemplateState();
}

class Content {
  bool cipher = false;
  var iconColor = Colors.green;

  var str = "";
  var nav = GlobalKey<NavigatorState>();

  void show(String str) {
    var context = nav.currentState!.overlay!.context;
    var dialog = AlertDialog(
      content: Text(str),
    ); // AlertDialog
    showDialog(context: context, builder: (x) => dialog);
  }
}

TextEditingController txtControllerName = TextEditingController();
TextEditingController txtControllerTelephoneNumber = TextEditingController();
TextEditingController txtControllerEmail = TextEditingController();

TextEditingController txtControllerExperience = TextEditingController();
TextEditingController txtControllerSkills = TextEditingController();
TextEditingController txtControllerEducation = TextEditingController();
var list2 = <Widget>[];

getList() {
  var list = <Widget>[
    Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Center(
              child: Text(
            'Resume Info',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          )),
          MyTextField(
            controller: txtControllerName,
            labelName: 'Name',
            hint: 'Enter Your Name',
            textType: TextInputType.text,
            icon: Icons.person,
            iconColor: Colors.blue,
          ),
          MyTextField(
            controller: txtControllerTelephoneNumber,
            labelName: 'Telephone Number',
            hint: 'Enter Your Telephone Number',
            textType: TextInputType.text,
            icon: Icons.opacity,
            iconColor: Colors.blue,
          ),
          MyTextField(
            controller: txtControllerEmail,
            labelName: 'Email',
            hint: 'Enter Your Education Email',
            textType: TextInputType.text,
            icon: Icons.email_outlined,
            iconColor: Colors.blue,
          ),
          MyTextField(
            controller: txtControllerExperience,
            labelName: 'Experience',
            hint: 'Enter Your Experience',
            textType: TextInputType.text,
            icon: Icons.info_outline,
            iconColor: Colors.blue,
          ),
          MyTextField(
            controller: txtControllerSkills,
            labelName: 'Skills',
            hint: 'Enter Your Skills',
            textType: TextInputType.text,
            icon: Icons.sports_hockey,
            iconColor: Colors.blue,
          ),
          MyTextField(
            controller: txtControllerEducation,
            labelName: 'Education',
            hint: 'Enter Your Education',
            textType: TextInputType.text,
            icon: Icons.school_outlined,
            iconColor: Colors.blue,
          ),
        ],
      ),
    ),
    Column(
      children: list2,
    ),
  ];
  return list;
}

class _CreateTemplateState extends State<CreateTemplate> {
  var c;

  CreateTemplate(content) {
    c = content;
    c.getList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(children: getList()),
              ),
            ),
          ),
          // floatingActionButton:
          //     Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          //   FloatingActionButton(
          //     onPressed: () => {},
          //     child: Icon(Icons.navigate_before_rounded),
          //     heroTag: "fab1",
          //   ),
          //   FloatingActionButton(
          //     onPressed: () => {},
          //     child: Icon(Icons.navigate_next_rounded),
          //     heroTag: "fab2",
          //   ),
          // ])

          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.done_outline_rounded),
                onPressed: () {
                  setState(() {
                    list2.add(People(
                      name: txtControllerName.text,
                      telephoneNumber: txtControllerTelephoneNumber.text,
                      email: txtControllerEmail.text,
                      experience: txtControllerExperience.text,
                      skills: txtControllerSkills.text,
                      education: txtControllerEducation.text,
                    ).getTemplate());
                  });
                },
              ),
             const SizedBox(width: 10.0),
              FloatingActionButton(
                child: const Icon(Icons.arrow_forward_ios_sharp),
                onPressed: () {
                  navigateTo(context: context, widget: const UserLayoutScreen());
                },



              ),
            ],
          )),
    );
  }
}
//
// floatingActionButton: FloatingActionButton.extended(
// label: const Text('Submit'),
// onPressed: () {
// setState(() {
// list2.add(People(
// name: txtControllerName.text,
// telephoneNumber: txtControllerTelephoneNumber.text,
// email: txtControllerEmail.text,
// experience: txtControllerExperience.text,
// skills: txtControllerSkills.text,
// education: txtControllerEducation.text,
// )
//     .getTemplate());
// });
// },
// ),
