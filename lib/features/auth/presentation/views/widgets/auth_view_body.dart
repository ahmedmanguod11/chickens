import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_button.dart';
import 'package:chickens/core/widgets/custom_text_field.dart';
import 'package:chickens/core/widgets/password_field.dart';
import 'package:chickens/features/home/presentaion/views/main_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthViewBody extends StatefulWidget {
const AuthViewBody({super.key});

@override
State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

late String username, phone, address, password;
String landline = "none";
bool hasLandline = false;
bool isLoading = false;



void startLoading() {
setState(() {
isLoading = true;
});
}

void stopLoading() {
setState(() {
isLoading = false;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [
Padding(
padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
child: SingleChildScrollView(
child: Form(
key: formKey,
autovalidateMode: autovalidateMode,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 25),
CustomTextFormField(
onSaved: (value) => username = value!,
hintText: 'اسم المستخدم',
textInputType: TextInputType.text,
suffixIcon: Icon(Icons.person, color: Colors.grey[600]),
),
const SizedBox(height: 10),
PasswordField(onSaved: (value) => password = value!),
const SizedBox(height: 10),
CustomTextFormField(
onSaved: (value) => phone = value!,
hintText: 'رقم الهاتف',
textInputType: TextInputType.phone,
suffixIcon: Icon(Icons.phone, color: Colors.grey[600]),
),
const SizedBox(height: 10),
Text("هل يوجد رقم أرضي؟", style: AppTextStyles.bold13),
Row(
children: [
Radio(
value: false,
groupValue: hasLandline,
onChanged: (value) {
setState(() {
hasLandline = value!;
landline = "none";
});
},
),
const Text("لا يوجد"),
Radio(
value: true,
groupValue: hasLandline,
onChanged: (value) {
setState(() {
hasLandline = value!;
});
},
),
const Text("يوجد"),
],
),
if (hasLandline)
CustomTextFormField(
onSaved: (value) => landline = value!,
hintText: 'رقم الأرضي',
textInputType: TextInputType.phone,
suffixIcon: Icon(Icons.home, color: Colors.grey[600]),
),
const SizedBox(height: 10),
CustomTextFormField(
onSaved: (value) => address = value!,
hintText: 'العنوان التفصيلي',
textInputType: TextInputType.text,
suffixIcon: Icon(Icons.location_on, color: Colors.grey[600]),
),
const SizedBox(height: 15),
CustomButton(
text: 'تسجيل دخول',
onPressed: () async {
if (formKey.currentState!.validate()) {
formKey.currentState!.save();
startLoading();


                      try {
                        await FirebaseFirestore.instance
                            .collection('manguod')
                            .add({
                          'username': username,
                          'password': password,
                          'phone': phone,
                          'landline': landline,
                          'address': address,
                          'hasLandline': hasLandline,
                          'createdAt': Timestamp.now(),
                        });

                        // حفظ اسم المستخدم بعد التسجيل
                        await Prefs.setString('username', username);
                        Prefs.setBool('loggedIn', true);
                        stopLoading();

                        Navigator.pushReplacementNamed(
                          context,
                          MainView.routeName,
                        );
                      } catch (e) {
                        stopLoading();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("حدث خطأ أثناء التسجيل")),
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
              
              ],
            ),
          ),
        ),
      ),
      if (isLoading)
        Container(
          color: Colors.black.withOpacity(0.5),
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const SizedBox(
              width: 45,
              height: 45,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
    ],
  ),
);


}
}
