import 'package:figner_print_auth/core/utils/function/animation_transitions.dart';
import 'package:figner_print_auth/features/home/presentation/pages/home_screen.dart';
import 'package:figner_print_auth/navbar_view.dart';
import 'package:figner_print_auth/welcome_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeview';
  static const navbarview = '/navbarview';
  static const loginView = '/login';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimationTransitions.slideTransition(
                context, animation, child);
          },
        ),
      ),
      GoRoute(
        path: navbarview,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BottomNavBarView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimationTransitions.slideTransition(
                context, animation, child);
          },
        ),
      ),
    ],
  );
}
