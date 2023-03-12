import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dashboard.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const Dashboard(),
      routes: [
        GoRoute(
          path: 'profile',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              // transitionDuration: const Duration(seconds: 1),
              // fullscreenDialog: true,
              key: state.pageKey,
              child: const Profile(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                //return FadeTransition(
                //  opacity:
                //      CurveTween(curve: Curves.easeInOut).animate(animation),
                //  child: child,
                //);
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
