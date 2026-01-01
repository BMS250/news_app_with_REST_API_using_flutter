import 'package:flutter/material.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/core/resources/app_images.dart';
import 'package:news_project/features/home/home_api.dart';
import 'package:news_project/features/homeNav/view.dart';

import '../home/view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
    ).then((value) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeApi(),)
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.primaryColor),
      appBar: AppBar(
        backgroundColor: Color(AppColors.primaryColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 130),
            child: Image.asset(
              AppImages.splash,
            ),
          ),
        ],
      )
    );
  }
}
