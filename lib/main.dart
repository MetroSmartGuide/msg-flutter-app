import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:metro_smart_guide/screen/login_screen.dart';
import 'authentication/login.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '53eeed639b725e17ea274bca6296fb91');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Metro Smart Guide',
      theme: ThemeData(
        primaryColor: const Color(0xFFEF3332),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(UserController());
      }),
    );
  }
}
