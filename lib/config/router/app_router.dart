import 'package:dictionary_app/features/dictionary/presentation/screens/home/home_screen.dart';
import 'package:dictionary_app/features/dictionary/presentation/screens/splash/splash_screen.dart';
import 'package:dictionary_app/features/dictionary/presentation/screens/word_detail/word_detail_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/wordDetail',
      builder: (context, state) {
        final word = state.extra as String;
        return WordDetailScreen(word: word);
      },
    ),
  ],
);
