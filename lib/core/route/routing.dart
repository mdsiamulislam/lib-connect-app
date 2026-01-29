import 'package:go_router/go_router.dart';
import 'package:libconnect/core/storage/user_pref.dart';
import 'package:libconnect/features/auth/screens/signin_screen.dart';
import 'package:libconnect/features/start_screen.dart';

class Routing {
  static String get initialRoute {
    final bool loggedIn = UserPref.isLoggedIn();
    return loggedIn ? '/start' : '/login';
  }

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(path: '/start', builder: (context, state) {
        return const StartScreen();
        },
      ),
      GoRoute(
        path: '/login',builder: (context, state) {
          return const SigninScreen();
        },
      )
    ]
  );



}