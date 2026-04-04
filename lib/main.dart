import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruithub_dashboard/core/helpers/on_generate_routes.dart';
import 'package:fruithub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruithub_dashboard/core/services/get_it_service.dart';
import 'package:fruithub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruithub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruithub_dashboard/firebase_options.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.supabaseInit();
  // if (!(await SupabaseStorageService.isBucketExists('fruits_images'))) {
  //   await SupabaseStorageService.createBucket('fruits_images');
  // }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoutes,
      debugShowCheckedModeBanner: false,
      // title: 'Fruit Hub',
      locale: const Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
