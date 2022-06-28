import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  const MessageBubble( this.username,this.message,this.isMe, {this.key}) : super(key: key) ;
  final key;
  final String? message;
  final String? username;
  final bool? isMe;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            mainAxisAlignment: isMe! ?MainAxisAlignment.end:MainAxisAlignment.start,
            children: [
              SizedBox(
                 width: MediaQuery.of(context).size.width/1.7,
                child: Material(
                  borderRadius: isMe!
                      ? const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                      :const  BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  elevation: 5.0,
                  color:
                  isMe! ? Colors.lightBlue:Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 13.0),
                    child: Column(
                      crossAxisAlignment: isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message!,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            letterSpacing: 1,
                            color: isMe!
                                ? kBoxColor
                                : const Color.fromRGBO(51, 51, 51, 1),
                          ),
                          textAlign: isMe! ? TextAlign.end : TextAlign.start,

                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
