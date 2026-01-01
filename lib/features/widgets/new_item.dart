import 'package:flutter/material.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/features/save/view.dart';
import 'package:news_project/model/article.dart';

class NewItem extends StatelessWidget {
  final String newImage;
  final String newTitle;
  final String newSubTitle;
  final String newDate;
  const NewItem({
    super.key,
    required this.newImage,
    required this.newTitle,
    required this.newSubTitle,
    required this.newDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Save(article: Article(
            author: newTitle,
            description: newSubTitle,
            urlToImage: newImage,
            publishedAt: newDate
          ))),
        ),
        child: Row(
          spacing: 32,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(newImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error_outlined, color: Colors.red,);
                  }, width: 148, height: 91),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newTitle,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    newSubTitle,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        newDate,
                        style: TextStyle(
                          color: Color(AppColors.newDateColor),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
