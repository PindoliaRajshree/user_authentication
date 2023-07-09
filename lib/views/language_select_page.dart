import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_authentication/utils/colorcode.dart';
import 'package:user_authentication/views/login_page.dart';

class Language_Select_Page extends StatefulWidget {
  const Language_Select_Page({super.key});

  @override
  State<Language_Select_Page> createState() => _Language_Select_PageState();
}

class _Language_Select_PageState extends State<Language_Select_Page> {
  var width, height;
  List<String> languages = ['English', 'Hindi', 'Gujarati'];
  List locale = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
    Locale('gu', 'IN'),
  ];
  String? language_value;

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    language_value = languages[0];
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 128,
                    child: Image.asset(
                      'assets/images/language_img.png',
                      width: 56,
                      height: 56,
                    ),
                  ),
                  Positioned(
                    top: 216,
                    width: 261,
                    height: 23,
                    child: Text(
                      'LangTitle'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 247,
                    width: 185,
                    height: 32,
                    child: Text(
                      'LangsubTitle'.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorCode.grey,
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 303,
                    child: Container(
                      width: 216,
                      height: 48,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorCode.black_main, width: 1),
                      ),
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          items: languages
                              .map((e) => DropdownMenuItem<String>(
                                    child: Text(e.tr),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              language_value = value;
                              if (language_value == 'English')
                                updateLanguage(Locale('en', 'US'));
                              else if (language_value == 'Hindi')
                                updateLanguage(Locale('hi', 'IN'));
                              else if (language_value == 'Gujarati')
                                updateLanguage(Locale('gu', 'IN'));
                            });
                          },
                          value: language_value,
                          icon: Icon(Icons.arrow_drop_down_sharp,
                              color: ColorCode.grey),
                          iconSize: 21,
                          style: TextStyle(
                              color: ColorCode.black_main,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 375,
                    width: 216,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorCode.dark_navy_blue,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login_Page()),
                        );
                      },
                      child: Text(
                        'Next'.tr,
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
                        'assets/images/Vector.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 112.89,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Vector_1.png',
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
}
