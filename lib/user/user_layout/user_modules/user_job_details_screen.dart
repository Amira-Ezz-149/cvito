import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/constants/sized_config.dart';
import 'package:cvito/company/company_layout/custom_widgets/basic_custom_button.dart';
import 'package:flutter/material.dart';

class UserJobDetailsScreen extends StatelessWidget {
  String? jobTitle;

  UserJobDetailsScreen({required this.jobTitle});

  List<String> levels = [
    'Full-time  .  Entry-level',
    'part-time  .  inter-level',
    'Full-time  .  Advanced-level',
  ];

  List<IconData> icons = [
    Icons.shopping_bag,
    Icons.calendar_today_rounded,
    Icons.check_circle
  ];

  List<Color> colors = [Colors.grey, Colors.grey, Colors.green];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // getProportionateScreenHeight
    // getProportionateScreenWidth

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: kCustomBlack,
                        onPressed: () {
                          Navigator.pop(context);
                          //TODO implement function
                        }),
                    SizedBox(width: getProportionateScreenWidth(20.0)),
                    const Text('Job Details',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: kCustomBlack)),
                    const SizedBox(height: 80.0),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(jobTitle!,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: kCustomBlack,
                            fontWeight: FontWeight.w500)),
                    SizedBox(width: getProportionateScreenWidth(20.0)),
                    // const Icon(Icons.more_vert)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30.0)),
                Row(
                  children: [
                    const CircleAvatar(
                        backgroundColor: kBasicColor,
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/company.png')),
                    SizedBox(width: getProportionateScreenWidth(15.0)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Software Company'),
                        Text('Staffing & Recruiting.Cairo'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SizedBox(
                    height: 150,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  icons[index],
                                  color: colors[index],
                                ),
                              ),
                              Text(levels[index]),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getProportionateScreenHeight(30.0),
                          );
                        },
                        itemCount: 3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BasicCustomButton(
                          text: 'Apply',
                          function: () {
                            showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 45.0),
                                      title: Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      content: Text(
                                        'Your application was sent successfully!',
                                        style: TextStyle(fontSize: 16.0),
                                        textAlign: TextAlign.center,
                                      ),
                                    ));
                          },
                        ),
                      ),
                      // SecondaryCustomButton(text: 'Save', function: () {})
                    ],
                  ),
                ),
                const SizedBox(height: 35.0),
                const Text(
                  'Job Description',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: kCustomBlack),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '''Envision Employment Solutions is currently on the look for a UI/UX Product Designer for one of our clients, a multinational e-commerce company. ''',
                  style: TextStyle(color: kCustomBlack),
                ),
                const SizedBox(height: 25.0),
                const Text(
                  'Job Summary',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: kCustomBlack),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  '''Our partner is looking for an experienced and creative UI/UX Designer to join their team! The UI/UX designer. ''',
                  style: TextStyle(color: kCustomBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
