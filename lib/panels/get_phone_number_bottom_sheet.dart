import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piamito_auth/services/payamito_api.dart';
import 'package:piamito_auth/widgets/custom_button.dart';
import 'package:piamito_auth/widgets/custom_textfield.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class GetPhoneNumberBottomSheet extends StatefulWidget {
  GetPhoneNumberBottomSheet({super.key});


  @override
  State<GetPhoneNumberBottomSheet> createState() => _AuthCodeBottomSheetState();
}

class _AuthCodeBottomSheetState extends State<GetPhoneNumberBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 5,
      backgroundColor: Colors.blue,
      onClosing: () {},
      builder: (context) => Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                label: "شماره موبایل",
                controller: phoneNumberController,
                textFormat: TextFormatter.number,
                maxLength: 11,
                validate: true,
                extraValidate: (val){
                  String newVal=val!;
                  if(val[0]=="0"){
                    newVal= val.replaceFirst("0", "");
                  }
                  print(newVal);
                  if(newVal.length<10 || newVal[0]!="9" ){
                    print(newVal);
                    return "شماره معتبر نیست";
                  }
                },

              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: "احراز هویت",
                  color: Colors.green.shade900,
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      PayamitoApi.sentMessage(context,phoneNumberController.text);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
