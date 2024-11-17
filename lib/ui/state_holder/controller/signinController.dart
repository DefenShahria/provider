import 'dart:developer';
import 'package:flutter/cupertino.dart';
import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';
import 'auth_controller.dart';




class SigninController with ChangeNotifier {
  bool _signinVerificationInprogress = false;
  String _message = '';
  int _userid = 0;

  bool get signinverificationInprogress => _signinVerificationInprogress;

  String get message => _message;
  int get userid => _userid;

  Future<bool> verifySignin(String email, String password) async {
    _signinVerificationInprogress = true;
    notifyListeners();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.SignIn,
        {
          "email":email,
          "password":password
        });
    _signinVerificationInprogress = false;
    notifyListeners();
    log('Signin Response: ${response.responseJson}');
    if (response.issuccess) {
      await AuthController.setAccessToken(response.responseJson?['token']);
      print("AccessToken : ${response.responseJson?['token']}");
      _message = response.responseJson?['status'] ?? '';

      return true;
    } else {
      _message = response.responseJson?['message'] ?? 'Signin failed';
      return false;
    }
  }
}
