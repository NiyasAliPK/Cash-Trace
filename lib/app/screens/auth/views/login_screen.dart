import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/auth_provider.dart';
import 'package:cash_trace/app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return Scaffold(
      appBar: CommonAppbar(isLogin: true),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(24)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo or icon
                Icon(
                  Icons.account_circle,
                  size: SizeConstant.getHeightWithScreen(100),
                  color: Colors.deepPurple,
                ),
                SizedBox(height: SizeConstant.getHeightWithScreen(20)),

                // Welcome text
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: SizeConstant.large25Font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConstant.getHeightWithScreen(10)),
                Text(
                  'Sign in to continue to the app',
                  style: TextStyle(
                    fontSize: SizeConstant.largeFont,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: SizeConstant.getHeightWithScreen(30)),

                // Sign in button
                SizedBox(
                  width: double.infinity,
                  height: SizeConstant.getHeightWithScreen(50),
                  child: ElevatedButton.icon(
                    onPressed: authState == AuthStates.loading
                        ? null
                        : () =>
                            ref.read(authStateProvider.notifier).signInWithGoogle(),
                    icon: authState == AuthStates.loading
                        ? Container(
                            width: SizeConstant.getHeightWithScreen(24),
                            height: SizeConstant.getHeightWithScreen(24),
                            padding: EdgeInsets.all(2.0),
                            child: CircularProgressIndicator(
                              strokeWidth: SizeConstant.getHeightWithScreen(2),
                            ),
                          )
                        : Icon(Icons.account_circle_outlined,
                            size: SizeConstant.getHeightWithScreen(20)),
                    label: Text(
                      authState == AuthStates.loading
                          ? "Signing In..."
                          : "Sign In with Google",
                      style: TextStyle(fontSize: SizeConstant.largeFont),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      elevation: 2,
                    ),
                  ),
                ),

                // Error message
                if (authState == AuthStates.error)
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConstant.getHeightWithScreen(24)),
                    child: Container(
                      padding:
                          EdgeInsets.all(SizeConstant.getHeightWithScreen(12)),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(
                            SizeConstant.getHeightWithScreen(8)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red),
                          SizedBox(width: SizeConstant.getHeightWithScreen(12)),
                          Expanded(
                            child: Text(
                              "Sign in failed. Please try again.",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
