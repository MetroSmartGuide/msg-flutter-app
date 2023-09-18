// ignore_for_file: unused_element
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as k;
import 'package:http/http.dart' as http;
import 'package:metro_smart_guide/screen/login_screen.dart';
import 'dart:convert';
import '../screen/home_screen.dart';
import 'model.dart';

class UserController extends GetxController {
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();
    signInWithKakao();
  }

  void updateUser() async {
    k.User kakaoUser = await k.UserApi.instance.me();
    user.update((val) {
      val?.uid = kakaoUser.id.toString();
      val?.email = kakaoUser.kakaoAccount?.email;
      val?.nickname = kakaoUser.properties?['nickname'];
    });

    var url = Uri.parse('http://msg-server.duckdns.org/api/v1/auth/login');
    var response =
        await http.post(url, body: json.encode(user.value.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      print('${response.body}');
      Get.offAll(const Home());
    }
  }

  Future<void> signInWithKakao() async {
    if (await k.isKakaoTalkInstalled()) {
      try {
        await k.UserApi.instance.loginWithKakaoTalk();
        updateUser();
      } catch (error) {
        print("카카오톡으로 로그인 실패 $error");

        if (error is PlatformException && error.code == 'CANCELED') {
          print("카카오톡으로 로그인 실패 $error");
        }

        try {
          await k.UserApi.instance.loginWithKakaoAccount();
          updateUser();
        } catch (error) {
          print("카카오 계정으로 로그인 실패 $error");
        }
      }
    } else {
      try {
        await k.UserApi.instance.loginWithKakaoAccount();
        updateUser();
      } catch (error) {
        print("카카오 계정으로 로그인 실패 $error");
      }
    }
  }

  Future<void> signOutWithKakao() async {
    try {
      await k.UserApi.instance.logout();
      user.update((val) {
        val?.uid = null;
        val?.email = null;
        val?.nickname = null;
      });
      print("로그아웃 성공");
      Get.offAll(const LoginScreen());
    } catch (error) {
      print("로그아웃 실패 $error");
    }
  }
}
