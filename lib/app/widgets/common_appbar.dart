// lib/widgets/common_appbar.dart
import 'package:cash_trace/app/providers/auth_provider.dart';
import 'package:cash_trace/app/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CommonAppbar({super.key, this.isLogin = false});
  final bool isLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    // For system theme, check actual brightness
    final actualIsDark = isDarkMode ||
        (ref.watch(themeModeProvider) == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    return PreferredSize(
      preferredSize: const Size(double.maxFinite, 100),
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                  visible: !isLogin,
                  child: IconButton(
                      onPressed: () {
                        ref.read(authStateProvider.notifier).signOut();
                      },
                      icon: Icon(Icons.logout))),
              Row(
                children: [
                  Icon(actualIsDark ? Icons.dark_mode : Icons.light_mode),
                  Switch.adaptive(
                    value: actualIsDark,
                    onChanged: (value) {
                      ref.read(themeModeProvider.notifier).toggleThemeMode();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
