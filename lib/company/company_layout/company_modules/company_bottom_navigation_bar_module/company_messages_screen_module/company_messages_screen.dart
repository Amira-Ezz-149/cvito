import 'package:cvito/company/company_layout/company_modules/company_software_company_module/company_software_company_screen.dart';
import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/company/company_layout/custom_widgets/custom_list_tile_messages.dart';
import 'package:cvito/company/company_layout/custom_widgets/custom_top_bar.dart';
import 'package:cvito/company/company_layout/custom_widgets/default_form_field.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CompanyMessagesScreen extends StatelessWidget {

  TextEditingController messagesSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=============================================================
              ///chats bar
              CustomTopBar(
                title: 'Chats',
                function: (){
                  navigateTo(context: context, widget: SoftwareCompanyScreen());
                },
                imageLink: 'assets/images/profile_photo.png',
                color: kCustomBlack,
              ),

              ///=============================================================
              ///search bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: defaultTextFormField(
                    controller: messagesSearchController,
                    type: TextInputType.text,
                    onChanged: () {},
                    label: 'Search',
                    prefix: Icons.search),
              ),


              ///=============================================================
              ///list tiles for chats
              BlocProvider(
                  create: (BuildContext context) => CVCubit(),
                  child: BlocConsumer<CVCubit, CVStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      CVCubit cubit = CVCubit.get(context);
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: ValueKey(index),
                              child: CustomListTileMessages(
                                user: cubit.chatUsers[index],
                                imageLink: cubit.UserImageLinks[index],
                                chatTime: cubit.UserChatTimes[index],
                              ),

                              /// start actions swap to right
                              startActionPane: ActionPane(
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    cubit.deleteChatItem(context, index);
                                  },
                                ),
                                extentRatio: 0.5,
                                motion: const StretchMotion(),
                                children: [
                                  // A SlidableAction can have an icon and/or a label.

                                  ///=================================================
                                  ///delete
                                  SlidableAction(
                                    onPressed: (BuildContext context) {
                                      debugPrint('delete');
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),

                                  SlidableAction(
                                    onPressed: (BuildContext context) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'the ${cubit.chatUsers[index]} chat is muted'),
                                            duration:
                                                const Duration(seconds: 1),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)))),
                                      );
                                      debugPrint('mute');
                                    },
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    icon: Icons.volume_off,
                                    label: 'Mute',
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          });
                    },
                  )),
            ],
          ),
        ),
      ),

      ///=======================================================================
      ///edit button
      floatingActionButton: SizedBox(
        width: 50.0,
        height: 50.0,
        child: FloatingActionButton(
          backgroundColor: kBasicColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {},
          child: const Icon(
            Icons.edit_outlined,
            size: 25,
          ),
        ),
      ),
    );
  }
}
