import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/init_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      final initFuture = ref.read(appInitProvider.future);
      final delayFuture = Future.delayed(const Duration(seconds: 2));

      await Future.wait([initFuture, delayFuture]);

      if (mounted) {
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to initialize app")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppThemeColors>();

    return Scaffold(
      body: Stack(
        children: [
          Container(color: colors?.background),
          Positioned(
            top: -20,
            left: -40,
            right: -40,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: colors?.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(300),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/appLogo.png',
                    fit: BoxFit.contain,
                    width: 150,
                    height: 150,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'WordNook',
                  // style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  //   color: AppColors.primaryBrown,
                  // ),
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colors?.text,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -40,
            right: -40,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: colors?.primary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(300)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
