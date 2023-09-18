import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:metro_smart_guide/screen/home_screen.dart';
import 'package:metro_smart_guide/authentication/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: () async => await userController.signInWithKakao(),
                color: const Color(0xffFEE500),
                child: const Text(
                  '카카오 로그인',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
