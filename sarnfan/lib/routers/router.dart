import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/screens/auth/sign_in.dart';
import 'package:sarnfan/screens/auth/sign_up.dart';
import 'package:sarnfan/screens/faq/faq.dart';
import 'package:sarnfan/screens/faq/how_to_get_verified.dart';
import 'package:sarnfan/screens/faq/how_to_use.dart';
import 'package:sarnfan/screens/faq/what_is_sarnfan.dart';
import 'package:sarnfan/screens/home.dart';
import 'package:sarnfan/screens/loading.dart';
import 'package:sarnfan/screens/post/create_post.dart';
import 'package:sarnfan/screens/post/my_post_detail.dart';
import 'package:sarnfan/screens/post/post_detail.dart';
import 'package:sarnfan/screens/profile/edit_description.dart';
import 'package:sarnfan/screens/profile/edit_location.dart';
import 'package:sarnfan/screens/profile/edit_profile.dart';
import 'package:sarnfan/screens/profile/my_history.dart';
import 'package:sarnfan/screens/profile/my_description.dart';
import 'package:sarnfan/screens/profile/my_location.dart';
import 'package:sarnfan/screens/profile/my_profile.dart';
import 'package:sarnfan/screens/profile/other_description.dart';
import 'package:sarnfan/screens/profile/other_history.dart';
import 'package:sarnfan/screens/profile/other_location.dart';
import 'package:sarnfan/screens/profile/other_profile.dart';
import 'package:sarnfan/screens/search.dart';
import 'package:sarnfan/screens/starred.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) {
      final provider = Provider.of<AppProvider>(context);
      provider.init();
      if (provider.isLoading) {
        return const LoadingScreen();
      }
      if (provider.isLoggedIn) {
        return const HomePage();
      } else {
        return const SignInPage();
      }
    },
  ),
  GoRoute(path: "/signin", builder: (context, state) => const SignInPage()),
  GoRoute(path: "/signup", builder: (context, state) => const SignUpPage()),
  GoRoute(path: "/home", builder: (context, state) => const HomePage()),
  GoRoute(path: "/search", builder: (context, state) => const SearchPage()),
  // GoRoute(path: "/help", builder: (context, state) => const TestPage()),
  GoRoute(path: "/faq", builder: (context, state) => const FAQPage()),
  GoRoute(path: "/starred", builder: (context, state) => const StarredPage()),
  GoRoute(
      path: "/what-is-sarnfan",
      builder: (context, state) => const WhatIsSarnFanPage()),
  GoRoute(
      path: "/how-to-use", builder: (context, state) => const HowToUsePage()),
  GoRoute(
      path: "/how-to-get-verified",
      builder: (context, state) => const HowToGetVerified()),

  GoRoute(
      path: "/create-post",
      builder: (context, state) => const CreatePostPage()),
  GoRoute(
      path: "/my-post-detail/:id",
      builder: (context, state) => MyPostDetailPage(
            postId: state.pathParameters['id']!,
          )),
  GoRoute(
      path: "/post-detail/:id",
      builder: (context, state) => PostDetailPage(
            postId: state.pathParameters['id']!,
          )),
  GoRoute(
      path: "/my-profile", builder: (context, state) => const MyProfilePage()),
  GoRoute(
      path: "/my-description",
      builder: (context, state) => const MyDescriptionPage()),
  GoRoute(
      path: "/other-description/:username",
      builder: (context, state) => OtherDescriptionPage(
            username: state.pathParameters['username']!,
          )),
  GoRoute(
      path: "/edit-description",
      builder: (context, state) => const EditDescriptionPage()),
  GoRoute(
      path: "/other-profile/:username",
      builder: (context, state) => OtherProfilePage(
            username: state.pathParameters['username']!,
          )),
  GoRoute(
      path: "/edit-profile",
      builder: (context, state) => const EditProfilePage()),
  GoRoute(
      path: "/my-history", builder: (context, state) => const MyHistoryPage()),
  GoRoute(
      path: "/other-history/:username",
      builder: (context, state) =>
          OtherHistoryPage(username: state.pathParameters['username']!)),
  GoRoute(
      path: "/my-location",
      builder: (context, state) => const MyLocationPage()),
  GoRoute(
      path: "/edit-location",
      builder: (context, state) => const EditLocationPage()),
  GoRoute(
      path: "/other-location/:username",
      builder: (context, state) =>
          OtherLocationPage(username: state.pathParameters['username']!)),
]);
