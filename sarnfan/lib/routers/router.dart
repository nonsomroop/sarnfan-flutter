import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/screens/auth/sign_in.dart';
import 'package:sarnfan/screens/auth/sign_up.dart';
import 'package:sarnfan/screens/test.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) {
      final provider = Provider.of<AppProvider>(context);
      if (provider.isLoggedIn) {
        return const TestPage();
      } else {
        return const SignInPage();
      }
    },
  ),
  GoRoute(path: "/signin", builder: (context, state) => const SignInPage()),
  GoRoute(path: "/signup", builder: (context, state) => const SignUpPage()),
  GoRoute(path: "/test", builder: (context, state) => const TestPage()),
  GoRoute(path: "/help", builder: (context, state) => const TestPage()),
  GoRoute(path: "/star", builder: (context, state) => const TestPage()),
  GoRoute(path: "/profile", builder: (context, state) => const TestPage()),
]);
