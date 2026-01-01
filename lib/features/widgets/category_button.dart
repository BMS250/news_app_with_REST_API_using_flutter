import 'package:flutter/material.dart';
import 'package:news_project/core/resources/app_colors.dart';

class CategoryButton extends StatelessWidget {
  final String buttonName;
  final bool isSelected;
  const CategoryButton({
    super.key,
    required this.buttonName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? Color(AppColors.selectedButtonColor)
                : Color(AppColors.unselectedButtonColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(
                color: !isSelected ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        SizedBox(width: 16)
      ],

    );
  }
}
