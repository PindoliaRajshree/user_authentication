import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_authentication/utils/colorcode.dart';
import 'package:user_authentication/views/language_select_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    logout();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => Language_Select_Page()),
                    );
                  },
                  child: Padding(
                    child: Icon(Icons.logout,
                        color: ColorCode.black_main, size: 20),
                    padding: EdgeInsets.all(10),
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome'.tr,
                  style: TextStyle(
                    color: ColorCode.black_main,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  auth.currentUser!.phoneNumber.toString(),
                  style: TextStyle(
                    color: ColorCode.black_main,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
