import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/screens/auth/sign_in.dart';
import 'package:sarnfan/screens/auth/sign_up.dart';
import 'package:sarnfan/screens/faq.dart';
import 'package:sarnfan/screens/home.dart';
import 'package:sarnfan/screens/post_detail.dart';
import 'package:sarnfan/screens/profile/edit_profile.dart';
import 'package:sarnfan/screens/profile/my_profile.dart';
import 'package:sarnfan/screens/search.dart';
import 'package:sarnfan/screens/test.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) {
      final provider = Provider.of<AppProvider>(context);
      // if (provider.isLoggedIn) {
      return const FAQPage();
      // } else {
      //   return const SignInPage();
      // }
    },
  ),
  GoRoute(path: "/signin", builder: (context, state) => const SignInPage()),
  GoRoute(path: "/signup", builder: (context, state) => const SignUpPage()),
  GoRoute(path: "/home", builder: (context, state) => const HomePage()),
  GoRoute(path: "/search", builder: (context, state) => const SearchPage()),
  GoRoute(path: "/test", builder: (context, state) => const FAQPage()),
  GoRoute(path: "/help", builder: (context, state) => const TestPage()),
  GoRoute(path: "/faq", builder: (context, state) => const FAQPage()),
  GoRoute(path: "/star", builder: (context, state) => const TestPage()),
  GoRoute(
      path: "/post-detail",
      builder: (context, state) => const PostDetailPage()),
  GoRoute(
      path: "/my-profile", builder: (context, state) => const MyProfilePage()),
  GoRoute(
      path: "/edit-profile",
      builder: (context, state) => const EditProfilePage()),
]);
