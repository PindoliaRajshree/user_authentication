import 'package:user_authentication/utils/CommonUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:user_authentication/utils/colorcode.dart';
import 'package:user_authentication/utils/custom_snackbar.dart';
import 'package:user_authentication/views/language_select_page.dart';
import 'package:user_authentication/views/otp_verify_page.dart';

class Login_Page extends StatefulWidget {
  static String verify = "";

  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var width, height;
  TextEditingController _mobileController = new TextEditingController();

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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => Language_Select_Page()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/Cancel.png',
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
                    width: 300,
                    child: Text(
                      'LoginTitle'.tr,
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
                    width: 171,
                    height: 32,
                    child: Text(
                      'LoginsubTitle'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorCode.grey,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.07,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 207,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorCode.black_main, width: 1),
                      ),
                    ),
                  ),
                  Positioned(
                      child: Image.asset(
                        'assets/images/india.png',
                        width: 24,
                        height: 24,
                      ),
                      left: 24,
                      top: 219),
                  Positioned(
                    top: 221,
                    left: 64,
                    width: 26,
                    height: 20,
                    child: Text(
                      '+91',
                      style: TextStyle(
                        color: ColorCode.black_main,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 221,
                    left: 106,
                    width: 8,
                    height: 20,
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: ColorCode.black_main,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 230,
                      left: 130,
                      width: 130,
                      height: 20,
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: ColorCode.grey,
                        ),
                        controller: _mobileController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile Number'.tr,
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: ColorCode.grey,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      )),
                  Positioned(
                    top: 279,
                    height: 56,
                    left: 16,
                    right: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorCode.dark_navy_blue,
                      ),
                      onPressed: () {
                        if (_mobileController.text.isEmpty) {
                          showSnackBar(context, 'Mobile Empty Check'.tr);
                        } else if (_mobileController.text.length != 10) {
                          showSnackBar(context, 'Mobile Valid Check'.tr);
                        } else {
                          loginUser();
                        }
                      },
                      child: Text(
                        'Continue'.tr,
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
    var appSignature = await SmsAutoFill().getAppSignature;
    Login_Page.verify = await CommonUtils.firebasePhoneAuth(
        phone: '+91' + _mobileController.text, context: context);

    Future.delayed(Duration(seconds: 5)).whenComplete(() {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OTP_Verify_Page(
                  mobile: '+91' + _mobileController.text,
                )));
        print('App Signature $appSignature');
      });
    });
  }
}
