import 'package:flutter/material.dart';
import 'package:grab_games/src/constants/app_colors.dart';
import 'package:grab_games/src/constants/app_dimens.dart';
import 'package:grab_games/src/constants/app_fonts.dart';
import 'package:grab_games/src/constants/app_strings.dart';
import 'package:grab_games/src/presentation/home_screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     waitAndNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: const [
            Align(
              alignment: Alignment.center,
              child: LogoSection(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: AppDimens.margin_medium_2x),
                child: FooterSection(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.loading_created_by_thurain,
      style: TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.6)),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/jsons/loading.json', width: AppDimens.width_loading),
        const Text(
          AppStrings.loading_grab_and_games,
          style: TextStyle(
            fontFamily: AppFonts.merienda,
            color: AppColors.color_primary,
            fontSize: AppDimens.text_header_1x,
          ),
        )
      ],
    );
  }
}
