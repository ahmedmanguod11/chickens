import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(

    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bodyBaseBold),
  );
}
