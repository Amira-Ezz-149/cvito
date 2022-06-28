import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:flutter/material.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/lists.dart';

void BottumSheetSite(BuildContext context){
  showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 128.0,vertical:26.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: kGrayColor130,
                      width: 103.0,
                      height: 3.72,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 124,bottom: 26),
                  child: text(
                    text:"select a site",
                    size: 18,
                    colors: kGrayColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: sites.length,
                    itemBuilder: (BuildContext context,int index){
                    return SizedBox(
                      height: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        color: Colors.white,
                        child:Hero(
                          tag:sites[index]['id'],
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: (){
                              showDialog(
                                useSafeArea: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: text(
                                      text: "You want to make your CV automated ?",
                                      colors: const Color.fromRGBO(28, 27, 31, 1),
                                      fontWeight: FontWeight.w400,
                                      size: 24,
                                    ),
                                    content: Builder(
                                      builder: (context){
                                        var width = MediaQuery.of(context).size.width;
                                        return  SizedBox(
                                          width: width,
                                          child: text(
                                              text: "Please give us your permission to access your informations.",
                                              colors: const Color.fromRGBO(73, 69, 79, 1),
                                              fontWeight: FontWeight.w400,
                                              size: 14,
                                              spacing: 0.25
                                          ),
                                        );
                                      },
                                    ),
                                    actions: [
                                      CustomButtonWithText(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        textColor:kBasicColor,
                                        height: 33,
                                        bottomColor: Colors.transparent,
                                        width: 124,
                                        text: 'I don’t agree',
                                        redus:6,
                                        border: null,
                                      ),
                                      CustomButtonWithText(
                                        onPressed: () { },
                                        textColor:Colors.white,
                                        height: 33,
                                        bottomColor: kBasicColor,
                                        width: 124,
                                        text: 'Agree',
                                        redus:6,
                                        border: null,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: GridTile(
                              child: Image.asset(sites[index]['site'],fit: BoxFit.fill,),
                            ),
                          ),
                        )
                      ),
                    );
                  },
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}