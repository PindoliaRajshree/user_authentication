import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_authentication/utils/colorcode.dart';
import 'package:user_authentication/views/home_page.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  var width, height;
  String? profile_name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile_name = 'Shipper';
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 112,
              width: 230,
              height: 23,
              child: Text(
                'ProfileTitle'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 161,
              left: 16,
              right: 16,
              height: 89,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 193,
              left: 32,
              child: InkWell(
                onTap: () {
                  setState(() {
                    profile_name = 'Shipper';
                  });
                },
                child: Container(
                  child: profile_name != 'Shipper'
                      ? Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        )
                      : Container(
                          height: 24,
                          width: 24,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: ColorCode.dark_navy_blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 185,
              left: 72,
              child: Image.asset(
                'assets/images/shipper.png',
                width: 40,
                height: 40,
              ),
            ),
            Positioned(
              top: 177,
              left: 128,
              width: 62,
              height: 21,
              child: Text(
                'Shipper'.tr,
                style: TextStyle(
                  color: ColorCode.black_main,
                  letterSpacing: 0.07,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 206,
              left: 128,
              width: 155,
              height: 28,
              child: Text(
                'Lorem ipsum dolor sit amet,consectetur adipiscing',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorCode.grey,
                  letterSpacing: 0.07,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 274,
              left: 16,
              right: 16,
              height: 89,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 306,
              left: 32,
              child: InkWell(
                onTap: () {
                  setState(() {
                    profile_name = 'Transporter';
                  });
                },
                child: Container(
                  child: profile_name != 'Transporter'
                      ? Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        )
                      : Container(
                          height: 24,
                          width: 24,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: ColorCode.dark_navy_blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 308,
              left: 72,
              child: Image.asset(
                'assets/images/transporter.png',
                width: 40,
                height: 25,
              ),
            ),
            Positioned(
              top: 290,
              left: 131,
              width: 94,
              height: 21,
              child: Text(
                'Transporter'.tr,
                style: TextStyle(
                  color: ColorCode.black_main,
                  letterSpacing: 0.07,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 319,
              left: 131,
              width: 155,
              height: 28,
              child: Text(
                'Lorem ipsum dolor sit amet,consectetur adipiscing',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorCode.grey,
                  letterSpacing: 0.07,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 387,
              left: 16,
              right: 16,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorCode.dark_navy_blue,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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
      ),
    ));
  }
}
