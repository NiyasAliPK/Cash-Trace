// lib/main.dart
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/routes/go_router_config.dart';
import 'package:cash_trace/app/theme/theme_controller.dart';
import 'package:cash_trace/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context, designSize: SizeConstant.defaultDesignSize);
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFF424242), // Medium-Dark Grey Primary
          onPrimary: Colors.white,
          secondary: const Color(0xFF757575), // Medium Grey Secondary
          onSecondary: Colors.white, // Dark Grey Text
          surface: Colors.white, // Very Light Grey Surface
          onSurface: const Color(0xFF212121), // Dark Grey Text on Surface
          error: const Color(0xFFB00020),
          onError: Colors.white,
          tertiary: const Color(0xFFBDBDBD), // Light-Medium Grey Tertiary
          outline: const Color(0xFF9E9E9E), // Medium Grey Outline
        ),
        scaffoldBackgroundColor: Color.fromARGB(
            255, 247, 247, 247), // Light mode scaffold background
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: const Color(
              0xFFBDBDBD), // Light-Medium Grey Primary for Dark Mode
          onPrimary: Colors.black,
          secondary:
              const Color(0xFF9E9E9E), // Medium Grey Secondary for Dark Mode
          onSecondary: Colors.black, // Very Light Grey Text
          surface: Colors.black, // Dark Grey Surface
          onSurface: const Color(0xFFEEEEEE), // Very Light Grey Text on Surface
          error: const Color(0xFFCF6679),
          onError: Colors.black,
          tertiary: const Color(
              0xFF616161), // Medium-Dark Grey Tertiary for Dark Mode
          outline: const Color(0xFF757575), // Medium Grey Outline for Dark Mode
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 30, 30, 30), // Dark mode scaffold background
      ),
    );
  }
}
