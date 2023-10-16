import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:piamito_auth/panels/auth_code_bottom_sheet.dart';

class PayamitoApi {
  static sentMessage(BuildContext context, String phoneNumber) async {
    Random random = Random();
    String authCode = (random.nextInt(8998) + 1001).toString();
    var messageBox = {
      "username": "5730097786",
      "password": "c191d4cb-46b8-49d1-a123-9ba92707472f",
      "text": "$authCode;",
      "to": phoneNumber,
      "bodyId": "164658",
    };

    http.Response res = await http.post(
        Uri.parse(
            "https://rest.payamak-panel.com/api/SendSMS/BaseServiceNumber"),
        body: messageBox);
    print("statusCode");
    print(res.statusCode);
    if (res.statusCode == 200) {
      Map backData = jsonDecode(res.body);
      print("backData");
      print(backData);
      if (backData["RetStatus"] == 1) {
        print("this part working");
        showModalBottomSheet(
          elevation: 5,
          context: context,
          isScrollControlled: true,
          builder: (context) =>Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AuthCodeBottomSheet(authCode: authCode,),
          ),
        );
      }
    }
  }
}
