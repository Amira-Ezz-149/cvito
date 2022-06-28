import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/lists.dart';
import '../widgets/tob_bar.dart';
class MyCvs extends StatelessWidget {
  const MyCvs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                //Tob bar
                Row(
                  children: [
                    Expanded(child: TobBar(Text: "My CV's")),
                    SizedBox(
                      width: 50,
                      child: CustomButtonWithIcon(onPressed: (){},color: kGrayColor130,icon: Icons.more_vert_outlined,size: 27),
                    )
                  ],
                ),
                //text automated cv
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 55,bottom: 25),
                  child: text(
                      text: "Automated CVs",
                      colors: kGrayColor,
                      size: 18,
                      fontWeight: FontWeight.w700),
                ),
                //My cvs automated
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesGridView.length,
                      itemBuilder: (BuildContext context,int index){
                    return Hero(
                      tag: imagesGridView[index]['id'],
                      child: InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              useSafeArea: true,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  insetPadding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 60),
                                  backgroundColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.only(top: 80,bottom: 5,left: 10,right: 10),
                                  title:CustomButtonWithIcon(onPressed: () {
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
                                            height: MediaQuery.of(context).size.height*0.35,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(24),
                                                    topLeft: Radius.circular(24))),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 56),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 80),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(30),
                                                      child: Container(
                                                        color: kGrayColor130,
                                                        width: 103,
                                                        height: 3.72,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(Colors.transparent)
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.download_sharp,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: kGrayColor, size: 18,text: 'Download',fontWeight: FontWeight.w500), // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.share_outlined,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: kGrayColor, size: 18,text: 'Share',fontWeight: FontWeight.w500),  // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.delete_rounded,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: Colors.black, size: 18,text: 'Delete',fontWeight: FontWeight.w500),  // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20,),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },size: 35,icon: Icons.more_vert_outlined,color: Colors.white),
                                  titlePadding: const EdgeInsets.only(left: 270,top: 50),
                                  content: Column(
                                    children: [
                                      Image.asset(imagesGridView[index]['modern'],fit: BoxFit.fill,),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: GridTile(
                          child: AspectRatio(
                            aspectRatio: 3/4.3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(imagesGridView[index]['modern'],fit: BoxFit.cover,)),
                          ),
                          // هنا ال title اللي هيدخله اليوزر
                          //footer: text(text: imagesGridView[index]['id'],size: 16,fontWeight: FontWeight.w500,colors: const Color.fromRGBO(28, 27, 31, 1)),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, _) => const SizedBox(width: 20,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 55,bottom: 25),
                  child: text(
                      text: "Manual CVs",
                      colors: kGrayColor,
                      size: 18,
                      fontWeight: FontWeight.w700),
                ),
                //my cvs manual
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesGridView.length,
                    itemBuilder: (BuildContext context,int index){
                      return Hero(
                        tag: imagesGridView[index]['id'],
                        child: InkWell(
                          onTap: (){
                            // Alert to show the cv as pdf
                            showDialog(
                                context: context,
                                useSafeArea: true,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    insetPadding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 60),
                                    backgroundColor: Colors.transparent,
                                    contentPadding: const EdgeInsets.only(top: 80,left: 10,right: 10),
                                    title:CustomButtonWithIcon(onPressed: () {
                                      // Bottom sheet to save and share and delete the cv
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
                                            height: MediaQuery.of(context).size.height*0.35,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(24),
                                                    topLeft: Radius.circular(24))),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 56),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 80),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(30),
                                                      child: Container(
                                                        color: kGrayColor130,
                                                        width: 103,
                                                        height: 3.72,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.transparent)
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.download_sharp,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: kGrayColor, size: 18,text: 'Download',fontWeight: FontWeight.w500), // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.share_outlined,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: kGrayColor, size: 18,text: 'Share',fontWeight: FontWeight.w500),  // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon( // <-- Icon
                                                          Icons.delete_rounded,
                                                          size: 22.0,
                                                          color: kGrayColor,
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        text(colors: Colors.black, size: 18,text: 'Delete',fontWeight: FontWeight.w500),  // <-- Text
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20,),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                      },size: 35,icon: Icons.more_vert_outlined,color: Colors.white),
                                    titlePadding: const EdgeInsets.only(left: 270,top: 50),
                                    content: Column(
                                      children: [
                                        Image.asset(imagesGridView[index]['professional'],fit: BoxFit.fill,),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: GridTile(
                            child: AspectRatio(
                             aspectRatio: 3/4.3,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(imagesGridView[index]['professional'],fit: BoxFit.cover,)),
                            ),
                            // هنا ال title اللي هيدخله اليوزر
                            //footer: text(text: imagesGridView[index]['id'],size: 16,fontWeight: FontWeight.w500,colors: const Color.fromRGBO(28, 27, 31, 1)),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, _) => const SizedBox(width: 20,),),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
