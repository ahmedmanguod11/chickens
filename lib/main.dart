import 'package:chickens/core/helper_functions/on_generate_routes.dart';
import 'package:chickens/core/services/custom_bloc_observer.dart';
import 'package:chickens/core/services/get_it_service.dart';
import 'package:chickens/core/services/shared_preferences_singleton.dart';
import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/features/splash/presentation/views/splash_view.dart';
import 'package:chickens/firebase_options.dart';
import 'package:chickens/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async { 
 WidgetsFlutterBinding.ensureInitialized(); 
 Bloc.observer = CustomBlocObserver();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

 await Prefs.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setupGetit();
  runApp(const Chickens()); 
}

class Chickens extends StatelessWidget {
  const Chickens({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}



