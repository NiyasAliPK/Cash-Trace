// lib/main.dart
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/routes/go_router_config.dart';
import 'package:cash_trace/app/theme/theme_controller.dart';
import 'package:cash_trace/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          primary: Color(0xFF1E88E5), // Blue - Branding color
          onPrimary: Colors.white,
          secondary: Color(0xFF43A047), // Green - Secondary actions
          onSecondary: Colors.white, // Dark text
          surface: Colors.white, // Cards, sheets
          onSurface: Color(0xFF212121),
          error: Color(0xFFD32F2F),
          onError: Colors.white,
          tertiary: Color(0xFFBDBDBD), // Subtle dividers, borders
          outline: Color(0xFFEEEEEE),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 250, 250, 250), // Light mode scaffold background
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF90CAF9), // Light blue - Branding
          onPrimary: Colors.black,
          secondary: Color(0xFFA5D6A7), // Muted green - accents
          onSecondary: Colors.black, // Text
          surface: Color(0xFF1E1E1E), // Cards, modals
          onSurface: Colors.white,
          error: Color(0xFFEF9A9A),
          onError: Colors.black,
          tertiary: Color(0xFF616161), // Dividers, subtle UIs
          outline: Color(0xFF2E2E2E),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor:
            Colors.grey[900], // Dark mode scaffold background
      ),
    );
  }
}
