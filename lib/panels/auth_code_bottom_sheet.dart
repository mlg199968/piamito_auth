import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piamito_auth/services/zarinpal_api.dart';
import 'package:piamito_auth/widgets/custom_button.dart';
import 'package:piamito_auth/widgets/custom_textfield.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class AuthCodeBottomSheet extends StatefulWidget {
  AuthCodeBottomSheet({super.key, required this.authCode});

  final String authCode;

  @override
  State<AuthCodeBottomSheet> createState() => _AuthCodeBottomSheetState();
}

class _AuthCodeBottomSheetState extends State<AuthCodeBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final authCodeController = TextEditingController();

  final userFullNameController = TextEditingController();

  PaymentRequest paymentRequest = PaymentRequest();

  String? payReference;

  @override
  void initState() {
    paymentRequest
      ..setIsSandBox(true)
      ..setAmount(1000)
      ..setDescription("description")
      ..setMerchantID("332f20e0-3333-41ce-b15d-aff7476a92ba")
      ..setCallbackURL("https://mlggrand2.ir/profileScreen");
    super.initState();
  }

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
              CustomTextField(
                  validate: true,
                  label: "نام و نام خانوادگی",
                  controller: userFullNameController),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                validate: true,
                label: "کد ارسال شده",
                controller: authCodeController,
                extraValidate: (val) {
                  if (widget.authCode != val) {
                    return "کد وارد شده معتبر نمی باشد!";
                  }
                },
              ),
              SizedBox(
                height: 18,
              ),
              CustomButton(
                  text: "ادامه فرایند خرید",
                  color: Colors.green,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ZarinpalApi.payment(paymentRequest);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
