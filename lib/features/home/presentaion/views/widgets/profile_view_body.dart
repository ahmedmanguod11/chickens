import 'package:chickens/constants.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:chickens/core/widgets/custom_app_bar.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool notifications = false;
  bool darkMode = false;
  String language = 'العربية';

  @override
  Widget build(BuildContext context) {
    // قراءة الاسم ورقم الهاتف من SharedPreferences
    String name = Prefs.getString('username');
    if (name.trim().isEmpty) name = 'مستخدم';

    String phone = Prefs.getString('phone');
    if (phone.trim().isEmpty) phone = 'رقم الهاتف غير متوفر';

    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: kTopPaddding),
                    buildAppBar(
                      context,
                      title: 'حسابي',
                      showNotification: false,
                      showBackButton: false,
                    ),
                    const SizedBox(height: 16),

                    // Profile Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: AppTextStyles.bold19
                                      .copyWith(color: Colors.black),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  phone,
                                  style: AppTextStyles.regular16
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  "https://images.pexels.com/photos/11554698/pexels-photo-11554698.jpeg",
                                ),
                              ),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: AppColors.primaryColor2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // General Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle('عام'),
                          profileItem(Icons.person_outline, 'الملف الشخصي'),
                          profileItem(Icons.inventory_2_outlined, 'طلباتي'),
                          profileItem(Icons.account_balance_wallet_outlined,
                              'المدفوعات'),
                          profileItem(Icons.favorite_border, 'المفضلة'),
                          profileSwitchItem(Icons.notifications_none, 'الاشعارات',
                              notifications, (val) {
                            setState(() {
                              notifications = val;
                            });
                          }),
                          profileItem(Icons.language_outlined, 'اللغة',
                              subtitle: language),
                          profileSwitchItem(
                              Icons.color_lens_outlined, 'الوضع', darkMode,
                              (val) {
                            setState(() {
                              darkMode = val;
                            });
                          }),
                          const SizedBox(height: 20),
                          sectionTitle('المساعدة'),
                          profileItem(Icons.info_outline, 'من نحن'),
                          const SizedBox(height: 30),

                          // Logout Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.logout_outlined),
                              label: const Text('تسجيل الخروج'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[50],
                                foregroundColor: AppColors.primaryColor2,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                // إظهار رسالة التأكيد
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('تأكيد الخروج'),
                                    content: const Text(
                                        'هل أنت متأكد من تسجيل الخروج؟'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop(); // الغاء
                                        },
                                        child: const Text('لا'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(ctx).pop(); // اغلاق الديالوج
                                          try {
                                            // تسجيل الخروج من Firebase
                                            await FirebaseAuth.instance.signOut();

                                            // مسح بيانات SharedPreferences
                                            await Prefs.clear();

                                            // العودة لشاشة OnBording
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const OnBording(),
                                              ),
                                            );
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'حدث خطأ أثناء تسجيل الخروج: '),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('نعم'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget profileItem(IconData icon, String title, {String? subtitle}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: AppColors.primaryColor2,
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
      onTap: () {},
    );
  }

  Widget profileSwitchItem(
      IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: (val) => onChanged(val),
        activeColor: Colors.green,
      ),
    );
  }
}
