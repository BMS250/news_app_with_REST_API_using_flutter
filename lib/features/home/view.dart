import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/core/resources/app_icons.dart';
import 'package:news_project/core/resources/app_images.dart';
import 'package:news_project/features/home/home_state.dart';
import 'package:news_project/features/widgets/category_button.dart';
import 'package:news_project/features/widgets/new_item.dart';
import 'package:news_project/model/article.dart';

class Home extends StatelessWidget {
  final List<Article> articles;
  const Home(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = ["All", "Politic", "Sport", "Education"];
    List<bool> isSelected = [true, false, false, false];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey.shade200,
        leading: Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(AppIcons.menu),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(AppIcons.search),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(AppIcons.bell),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breaking News",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Show More",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.showMoreColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(40),
              ),
              clipBehavior: Clip.hardEdge,
              // child: Image.asset(AppImages.main),
              child: Image.network(articles[0].urlToImage as String),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buttons.length,
                itemBuilder: (context, index) => CategoryButton(
                  buttonName: buttons[index],
                  isSelected: isSelected[index],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News For You",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Show More",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.showMoreColor),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => NewItem(
                newImage: articles[index + 1].urlToImage as String,
                newTitle: articles[index + 1].author as String,
                newSubTitle: articles[index + 1].description as String,
                newDate: articles[index + 1].publishedAt as String,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
