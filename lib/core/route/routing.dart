import 'package:go_router/go_router.dart';
import 'package:libconnect/features/auth/screens/signin_screen.dart';
import 'package:libconnect/features/start_screen.dart';

class Routing {

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) {
        return const StartScreen();
        },
      ),
      GoRoute(
        path: '/home',builder: (context, state) {
          return const SigninScreen();
        },
      )
    ]
  );

}