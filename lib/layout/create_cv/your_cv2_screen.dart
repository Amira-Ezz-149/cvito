import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:flutter/material.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/tob_bar.dart';
import 'package:cvito/layout/widgets/lists.dart';

class YourCv extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  YourCv({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Automated Cv
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 30,),
                child: TobBar(Text: "Automated CV"),
              ),
              //Circle avatar
              Padding(
                padding: const EdgeInsets.only(top: 70,left: 37),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset('assets/images/person1.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: text(
                          text: names.first,
                          size: 14,
                          fontWeight: FontWeight.w700,
                          spacing: 0.5,
                          colors: kGrayColor
                      ),
                    ),
                  ],
                ),
              ),
              // add more and view
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Add more and BottomSheet
                    SizedBox(
                      width: 150,
                      height: 210,
                      child: InkWell(
                        onTap: (){
                          ////////////////////////////////////////////
                          //BottomSheet
                          showModalBottomSheet(
                              context: context, 
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                )
                              ),
                              builder: (_){
                             return Container(
                               height: MediaQuery.of(context).size.height*0.50,
                               decoration: const BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(24),
                                       topLeft: Radius.circular(24))),
                               child: SingleChildScrollView(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                         padding: const EdgeInsets.only(top: 28,left: 129,right: 128),
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.circular(30),
                                         child: Container(
                                           color: kGrayColor130,
                                           width: 103,
                                           height: 3.72,
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 33,right: 190,top: 18,bottom: 14),
                                       child: SizedBox(
                                         width: 130,
                                         height: 30,
                                         child: text(
                                           text: "Recommended",
                                           size: 18,
                                           fontWeight: FontWeight.w700,
                                           colors: kGrayColor
                                         ),
                                       ),
                                     ),
                                     GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 0.75,
                                                      mainAxisSpacing: 10,
                                                      crossAxisCount: 2),
                                         itemBuilder: (BuildContext context,int index){
                                                return Padding(
                                                  padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
                                                  child: Card(
                                                    elevation: 15,
                                                    child: Hero(
                                                      tag: recomanded[index]['id'],
                                                      child: InkWell(
                                                        onTap: (){},
                                                        child: GridTile(
                                                          footer:Container(
                                                            color: Colors.white,
                                                            child: ListTile(
                                                              title: Padding(
                                                                padding: const EdgeInsets.only(left: 14),
                                                                child: Text(recomanded[index]['footer']),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Image.asset(recomanded[index]['cv'],fit: BoxFit.cover,),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                         },
                                       itemCount: recomanded.length,
                                       shrinkWrap: true,
                                     )
                                   ],
                                 ),
                               ),
                             );
                          });
                        },
                        child: Image.asset('assets/images/addmore.png',fit: BoxFit.cover,),
                      )
                    ),
                    const SizedBox(width: 16,),
                    ///////////////////////////////////////////////////
                    //دا جزء ال cv بعد ما يتعمل ال Web Scrabing يعني هنختار template معين
                    // وبعدين اختار site وبعدين احفظها ف الداتا وبعدين اسحبها من الداتا واحطها هنا
                    SizedBox(
                      height: 210,
                      width: 150,
                      child: Card(
                        child: Hero(
                          tag: "Cv",
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: (){
                              showDialog(
                                  context: context,
                                  useSafeArea: true,
                                  builder: (BuildContext context){
                                return AlertDialog(
                                  insetPadding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 70),
                                  backgroundColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.only(top: 80,bottom: 5,left: 10,right: 10),
                                  title:CustomButtonWithIcon(onPressed: () {Navigator.of(context).pop();},size: 35,icon: Icons.clear_outlined,color: Colors.white),
                                  titlePadding: const EdgeInsets.only(left: 270,top: 50),
                                  content: Column(
                                    children: [
                                      Image.asset("assets/images/cv_modern/cv7.jpg",fit: BoxFit.fill,),
                                    ],
                                  ),
                                );
                              });
                            },
                            child: GridTile(
                              footer: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.view_comfortable_sharp,size: 35,color: Colors.white,),
                                    text(text: 'View', colors: kBoxColor, size: 14, fontWeight: FontWeight.w500,spacing: 0.5)
                                  ],
                                ),
                              child: Image.asset("assets/images/cv_modern/cv7.jpg",fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //add title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 328,
                  height: 73,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.95),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1.5,
                          color: Colors.black12
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 6),
                        child: text(
                          size: 12,
                          text: "Add Title",
                          spacing: 0.4,
                          colors: kBasicColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      textFormField(
                          radious: 0,
                          color: kBoxColor,
                          type: TextInputType.multiline,
                          hintstyle: const TextStyle(
                              color: kGrayColor130,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            fontSize: 12,
                          ),
                          hint: "Untitled",
                          controller: titleController
                      )
                    ],
                  ),
                ),
              ),
              //save
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 16,right: 16),
                child: CustomButtonWithText(
                  redus: 6,
                  height: 55,
                  width: 328,
                  bottomColor: kBasicColor,
                  textColor: kBoxColor,
                  text: "Save",
                  onPressed: () {
                   showDialog(
                       context: context,
                       useSafeArea: true,
                       builder: (_){
                     return AlertDialog(
                       insetPadding:const EdgeInsets.symmetric(horizontal: 20.0,),
                       content: SizedBox(
                         width: MediaQuery.of(context).size.width,
                         height: 200,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(
                               child: Image.asset("assets/images/save.jpg"),
                               height: 50,
                               width: 50,
                             ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 20),
                               child: SizedBox(
                                 width: 175,
                                 height: 16,
                                 child: text(
                                          text: 'Your CV Saved Successfully!',
                                          fontWeight: FontWeight.w500,
                                          size: 12,
                                          spacing: 0.5,
                                          colors: kGrayColor),
                                    ),
                             ),
                           ],
                         ),
                       ),

                     );
                   });
                  },
                  border: Border.all(color: kBasicColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
