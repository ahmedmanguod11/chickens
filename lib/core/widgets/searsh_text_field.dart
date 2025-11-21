import 'package:chickens/core/utils/app_images.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField();
  final TextInputType textInputType = TextInputType.text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ], 
        ),
        child: SizedBox(height: 40,
          child: TextField(
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: 'ابحث عن.......',
              hintStyle: AppTextStyles.bodyBaseBold.copyWith(color: Colors.grey[600]),
              prefixIcon: SizedBox(width: 20, child: Center(child: SvgPicture.asset(Assets.search))),
              suffixIcon: SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.filter))),
              filled: true,
              fillColor: Colors.white,
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    );
  }
}
