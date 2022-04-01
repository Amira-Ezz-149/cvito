import 'package:cvito/constants/constants.dart';
import 'package:cvito/cubit/cubit.dart';
import 'package:cvito/cubit/states.dart';
import 'package:cvito/layout/widgets/custom_list_tile_messages.dart';
import 'package:cvito/layout/widgets/custom_top_bar.dart';
import 'package:cvito/layout/widgets/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UserMessagesScreen extends StatelessWidget {

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
              ///unread messages number

              /*     const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Text.rich(
                      TextSpan(
                      text: 'Unread ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '(2)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.red),
                        ),
                      ])),
                ),*/

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
                                user: cubit.UserChatUsers[index],
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
                                                'the ${cubit.UserChatUsers[index]} chat is muted'),
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
