import 'package:flutter/material.dart';
import 'package:piamito_auth/panels/get_phone_number_bottom_sheet.dart';
import 'package:piamito_auth/services/zarinpal_api.dart';
import 'package:piamito_auth/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PaymentRequest paymentRequest = PaymentRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  text: "خرید مستقیم",
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: GetPhoneNumberBottomSheet(),
                            ));
                  }),
              CustomButton(
                  text: "text",
                  onPressed: () {
                    ZarinpalApi.payment(paymentRequest);
                  }),
              CustomButton(text: "mlggrand",color: Colors.red, onPressed: (){
                launchUrl(Uri.parse("https://www.mlggrand.ir"),mode: LaunchMode.externalApplication);
              })
            ],
          ),
        ),
      ),
    );
  }
}
