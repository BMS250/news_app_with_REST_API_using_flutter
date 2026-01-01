import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/features/home/home_api.dart';
import 'package:news_project/features/home/view.dart';
import 'package:news_project/features/save/view.dart';
import 'package:news_project/features/search/view.dart';

import '../../core/resources/app_icons.dart';
import '../../model/article.dart';

class HomeNav extends StatefulWidget {
  final List<Article> articles;
  const HomeNav(this.articles, {super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  late List<Widget> screens = [Home(widget.articles), Search(widget.articles)];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(AppColors.primaryColor),
        // backgroundColor: Color(AppColors.primaryColor),
        backgroundColor: Colors.white,
        // height: 123,
        // elevation: 0,
        // currentIndex: currentIndex,
        // selectedItemColor: Color(AppColors.selectedButtonColor),
        // unselectedItemColor: Colors.white,
        // selectedLabelStyle: TextStyle(color: Color(AppColors.primaryColor)),
        // unselectedLabelStyle: TextStyle(color: Colors.white),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        buttonBackgroundColor: Color(AppColors.selectedButtonColor),
        items: [
          SvgPicture.asset(
            AppIcons.home,
            width: 20,
            colorFilter: ColorFilter.mode(
              Color(AppColors.unselectedButtonColor),
              // currentIndex == 0 ? Color(AppColors.selectedButtonColor) : Color(AppColors.unselectedButtonColor)
              BlendMode.srcIn,
            ),
          ),
          SvgPicture.asset(
            AppIcons.search,
            width: 20,
            colorFilter: ColorFilter.mode(
              Color(AppColors.unselectedButtonColor),
              // currentIndex == 0 ? Color(AppColors.selectedButtonColor) : Color(AppColors.unselectedButtonColor)
              BlendMode.srcIn,
            ),
          )
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     AppIcons.home,
          //     width: 20,
          //     colorFilter: ColorFilter.mode(
          //         currentIndex == 0 ? Color(AppColors.selectedButtonColor) : Color(AppColors.unselectedButtonColor)
          //         , BlendMode.srcIn),
          //   ),
          //   label: "Home",
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     AppIcons.search,
          //     width: 20,
          //     colorFilter: ColorFilter.mode(
          //         currentIndex == 1 ? Color(AppColors.selectedButtonColor) : Color(AppColors.unselectedButtonColor)
          //         , BlendMode.srcIn),
          //   ),
          //   label: "Search",
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     AppIcons.save,
          //     width: 20,
          //     colorFilter: ColorFilter.mode(
          //         currentIndex == 2 ? Color(AppColors.selectedButtonColor) : Color(AppColors.unselectedButtonColor)
          //         , BlendMode.srcIn),
          //   ),
          //   label: "Save",
          // ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
