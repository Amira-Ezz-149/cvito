import 'package:flutter/material.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
class CreateNewPassword extends StatefulWidget {
  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  String? _password;
  bool sec = true;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(top: 40,left: 15,right: 15),
                child: Row(
                  children: [
                    CustomButtonWithIcon(onPressed: (){},color: const Color.fromRGBO(130, 130, 130, 1),size: 25,icon: Icons.arrow_back),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: text(
                          text:"Forget Password",
                          colors: const Color.fromRGBO(79, 79, 79, 1),
                          size: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 88,top: 44,bottom: 22),
                child: text(
                    text: "Create new password",
                    colors: const Color.fromRGBO(0, 119, 181, 1),
                    size: 24,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left:26,right: 33,top: 20),
                child: SizedBox(
                  width: 301,
                  height: 52,
                  child: text(
                      text: "Your new password must be different from previous used passwords.",
                      colors: const Color.fromRGBO(130, 130, 130, 1),
                      spacing: 0.25,
                      size: 14,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:13,right: 278,bottom:1,top: 19),
                child: SizedBox(
                  width: 69,
                  height: 24,
                  child: text(
                      text: "Password",
                      colors: const Color.fromRGBO(130, 130, 130, 1),
                      spacing: 0.25,
                      size: 14,
                      align: TextAlign.left,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 16,right: 16),
                child: textFormField(
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    validate: (value){
                      if(value.isEmpty || value.length < 8){
                        return "must be at least 8 characters";
                      }else {
                        return null;
                      }
                    },
                    onSaved: (value) => _password = value,
                    type: TextInputType.visiblePassword,
                    hint: "Password",
                    radious: 0,
                    suffix: SizedBox(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              sec = !sec;
                            });
                          },
                          child: Icon(sec ? Icons.visibility_off : Icons.visibility)),
                    ),
                    obscureText: sec,
                    maxline: 1
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16,right: 221,bottom:1,top:46),
                child: SizedBox(
                  width: 123,
                  height: 24,
                  child: text(
                      text: "Confirm Password",
                      colors: const Color.fromRGBO(130, 130, 130, 1),
                      spacing: 0.25,
                      size: 14,
                      align: TextAlign.left,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 16,right: 16,bottom: 55),
                child: textFormField(
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    validate: (value){
                      if(value.isEmpty || value.length == _password){
                        return "Both password must match";
                      }else {
                        return null;
                      }
                    },
                    type: TextInputType.visiblePassword,
                    hint: "Confirm Password",
                    radious: 0,
                    obscureText: sec,
                    maxline: 1
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                    },
                    child: FittedBox(
                      child: Container(
                        width: 328,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: kBasicColor),
                          color: const Color.fromRGBO(0, 119, 181, 1),
                          borderRadius: BorderRadius.circular(6),),
                        child: text(
                            text: "Reset Password",
                            colors: const Color.fromRGBO(255, 255, 255, 1),
                            spacing: 0.1,
                            size: 14,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}