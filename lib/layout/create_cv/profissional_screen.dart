import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:cvito/layout/widgets/lists.dart';
import 'package:cvito/layout/widgets/tob_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/basic_constant_text.dart';
import 'bottom_sheet_widget.dart';
class ProfessionalScreen extends StatelessWidget {
  const ProfessionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 30,),
                child: TobBar(Text: "Professional CVs"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 83,left: 37,),
                child: text(
                  text: "Select a template",
                  colors: kGrayColor,
                  fontWeight: FontWeight.w700,
                  size: 18
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 23),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imagesGridView.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                          childAspectRatio: 0.60,
                          mainAxisSpacing: 10 ,
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context,int index){
                        return Card(
                          child: Hero(
                            tag: imagesGridView[index]['id'],
                            child: InkWell(
                              onTap: (){
                                BottomSheets(context);
                              },
                              child: GridTile(
                                child: Image.asset(imagesGridView[index]['professional'],fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        );
                      })
                ),
            ],
          ),
        ),
      ),
    );
  }
}

