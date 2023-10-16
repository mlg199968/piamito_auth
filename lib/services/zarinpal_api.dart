
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class ZarinpalApi{

static  payment(PaymentRequest paymentRequest) {
    int id=5;
    paymentRequest
      ..setIsSandBox(true)
      ..setAmount(1000)
      ..setDescription("description")
      ..setMerchantID("332f20e0-3333-41ce-b15d-aff7476a92ba")
      ..setCallbackURL("https://mlggrand2.ir/profileScreen?user_id=$id");

    ZarinPal().startPayment(paymentRequest, (status, paymentGatewayUri) {
      try {
        if (status == 100) {
          launchUrl(Uri.parse(paymentGatewayUri!),
              mode: LaunchMode.externalApplication);
        } else {
          Fluttertoast.showToast(
            msg: "error $status on the payment ",
          );
        }
      }catch(e){
        print("pay option error..");
        print(e);
      }
    });
  }
}