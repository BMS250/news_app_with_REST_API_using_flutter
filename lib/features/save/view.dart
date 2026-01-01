import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_project/core/resources/app_icons.dart';
import 'package:news_project/core/resources/app_images.dart';
import 'package:news_project/model/article.dart';

class Save extends StatefulWidget {
  final Article article;
  const Save({super.key, required this.article});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 14,),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back_ios_new)
              ),
            ),
          ],
        ),
        title: Text(
          "News Detail",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(AppIcons.save2)
          ),
          SizedBox(width: 14,)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.article.urlToImage ?? ""),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.article.author ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.favorite_border),
                        Text(
                          "204",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                widget.article.title ?? "",
                style: TextStyle(

                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 8,),
              Text(
                  widget.article.description ?? "",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 55,),
//               Text(
//                 """
// Xiaomi India has denied exiting the offline market for smart TV sales.
// The rebuttal comes in response to a claim made by  Super Plastronics
// Pvt Ltd chief executive officer, Avneet Singh Marwah,  that Xiaomi had
// closed its offline television sales last year,  apparently because it had
// ceased to serve as a viable business option.
//
// In a statement shared with FE over email, a company spokesperson said  that, “Xiaomi has a strong retail presence across multiple offline  channels besides Mi stores and Mi Homes including multi-brand stores, Mi  Preferred Partners as well as large format stores like Reliance,  Vijay Sales, Poorvika, Sangeetha, etc,” adding that brick-and-mortar  channels have been contributing to 50 percent of its smart TV sales in  the country.
//
// Underscoring the importance of offline to showcase “the superior quality  of Xiaomi smart TVs, and compare it with other marginal, fragmented  players,” the spokesperson reiterated that Xiaomi will continue to  strengthen its offline business across all categories, smart TVs  included, giving the best experience and choices across channels to its  customers.
//                 """,
//                 style: TextStyle(
//                     fontSize: 11,
//                     fontWeight: FontWeight.w500
//                 ),
//               ),
            ],
          ),
        ),
      ),
    );
  }
}
