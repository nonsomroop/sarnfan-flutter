import 'package:go_router/go_router.dart';
import 'package:sarnfan/screens/auth/sign_in.dart';
import 'package:sarnfan/screens/auth/sign_up.dart';
import 'package:sarnfan/screens/test.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(path: "/", builder: (context, state) => const SignUpPage()),
  GoRoute(path: "/signin", builder: (context, state) => const SignInPage()),
  GoRoute(path: "/signup", builder: (context, state) => const SignUpPage()),
  GoRoute(path: "/test", builder: (context, state) => const TestPage()),
]);
