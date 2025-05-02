import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/main.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Shop With Friends',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          elevation: 0,
        ),
      ),
    );
  }
}

class SessionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final sessionId = resolver.route.pathParams.getString('sessionId');
    final isValid = sessionId.isNotEmpty;
    if (isValid) {
      resolver.next(true);
    } else {
      navigatorKey.currentState?.pushNamed('/invalid-session');
      resolver.next(false);
    }
  }
}
