import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: AppTextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
