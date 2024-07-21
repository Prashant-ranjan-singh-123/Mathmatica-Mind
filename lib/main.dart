import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mathmatics_mind/screens/splash_screen/splash_screen.dart';
import 'Data/app_assets.dart';
import 'Data/app_strings.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppAssets(), permanent: true);
    Get.put(AppStrings(), permanent: true);
  }
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StartApp());
}

// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => StartApp(), // Wrap your app
//   ),
// );

class StartApp extends StatelessWidget {
  const StartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: const SplashScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Poppins',fontSize: 20.0, fontWeight: FontWeight.w600),
          )
      ),
    );
  }
}
