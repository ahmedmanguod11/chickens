// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:chickens/core/utils/app_text_styles.dart';
// import 'package:chickens/core/utils/app_colors.dart';
// class DontHaveAnAccount extends StatelessWidget {
//   const DontHaveAnAccount({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         children: [
//           TextSpan(
//             text: 'لا تمتلك حساب؟',
//             style: AppTextStyles.bodySmallRegular,
//           ),
//           TextSpan(
//             recognizer:
//                 TapGestureRecognizer()
//                   ..onTap = () {
//                     Navigator.pushNamed(context, SignupView.routeName);
//                   },
//             text: 'قم بانشاء حساب',
//             style: AppTextStyles.bodySmallBold.copyWith(
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
