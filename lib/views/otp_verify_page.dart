import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:user_authentication/utils/CommonUtils.dart';
import 'package:user_authentication/utils/colorcode.dart';
import 'package:user_authentication/utils/custom_snackbar.dart';
import 'package:user_authentication/views/home_page.dart';
import 'package:user_authentication/views/profile_page.dart';

class OTP_Verify_Page extends StatefulWidget {
  final String? mobile;

  const OTP_Verify_Page({super.key, this.mobile});

  @override
  State<OTP_Verify_Page> createState() => _OTP_Verify_PageState();
}

class _OTP_Verify_PageState extends State<OTP_Verify_Page> {
  var width, height;
  String otpCode = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    _listenOtp();
    super.initState();
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print('OTP Listen is called');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SmsAutoFill().unregisterListener();
    print('Unregistered Listener');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/images/Arrow Left.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 112,
                    height: 23,
                    width: 117,
                    child: Text(
                      'OTPTitle'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        letterSpacing: 0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 143,
                    width: 177,
                    height: 16,
                    child: Row(
                      children: [
                        Text(
                          'OTPsubTitle'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorCode.grey,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.07,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.mobile!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorCode.grey,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.07,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 183,
                    left: 11,
                    right: 11,
                    height: 48,
                    child: PinFieldAutoFill(
                      codeLength: 6,
                      currentCode: otpCode,
                      decoration: BoxLooseDecoration(
                        bgColorBuilder:
                            FixedColorBuilder(ColorCode.light_sky_blue),
                        gapSpace: 10,
                        radius: Radius.zero,
                        textStyle: TextStyle(
                          color: ColorCode.black_main,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        strokeColorBuilder:
                            FixedColorBuilder(ColorCode.light_sky_blue),
                      ),
                      keyboardType: TextInputType.number,
                      onCodeChanged: (code) {
                        otpCode = code.toString();
                        print('OnChanged: $code');
                      },
                      onCodeSubmitted: (val) {
                        print('OnCodeSubmit: $val');
                      },
                    ),
                  ),
                  Positioned(
                    top: 247,
                    left: 59,
                    width: 248,
                    height: 16,
                    child: Row(
                      children: [
                        Text(
                          'OTPHelp'.tr,
                          style: TextStyle(
                            color: ColorCode.grey,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.07,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            UserResendToken();
                          },
                          child: Text(
                            ' Request Again'.tr,
                            style: TextStyle(
                              color: ColorCode.black_main,
                              fontFamily: 'Roboto',
                              letterSpacing: 0.07,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 287,
                    height: 56,
                    left: 16,
                    right: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorCode.dark_navy_blue,
                      ),
                      onPressed: () {
                        print('OTP: $otpCode');
                        loginUser();
                      },
                      child: Text(
                        'Verify and Continue'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 112.89,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/login_layer.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future loginUser() async {
    try {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: CommonUtils.verify, smsCode: otpCode);
      await auth.signInWithCredential(authCredential);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Profile_Page()));
    } catch (e) {
      showSnackBar(context, 'Wrong OTP');
      print('Wrong OTP: $e');
    }
  }

  Future UserResendToken() async {
    try {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: await CommonUtils.firebaseResendToken(
              phone: widget.mobile!, context: context),
          smsCode: otpCode);
      await auth.signInWithCredential(authCredential);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      showSnackBar(context, 'Wrong OTP');
      print('Wrong OTP: $e');
    }
  }
}
