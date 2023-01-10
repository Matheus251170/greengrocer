import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/config/custom_colors.dart';
import 'package:greengrocer/src/pages/widgets/app_widget_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
        //     Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (c) => const SignInScreen(),
        //   ),
        // ),

    //     Get.offNamed(PagesRoutes.signInRoute);
    //   },
    // );
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade900,
              CustomColors.customSwatchColor.shade700,
              CustomColors.customSwatchColor.shade500,
              CustomColors.customSwatchColor.shade300,
              CustomColors.customSwatchColor.shade100,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppWidgetName(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
