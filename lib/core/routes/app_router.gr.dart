// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartInviteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartInviteScreen(),
      );
    },
    ConfirmationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmationScreen(),
      );
    },
    CreateSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateSessionScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InviteLandingRoute.name: (routeData) {
      final args = routeData.argsAs<InviteLandingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InviteLandingScreen(
          key: args.key,
          sessionId: args.sessionId,
        ),
      );
    },
    JoinSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinSessionScreen(),
      );
    },
    JoinSessionWithIdRoute.name: (routeData) {
      final args = routeData.argsAs<JoinSessionWithIdRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinSessionWithIdScreen(
          key: args.key,
          sessionId: args.sessionId,
        ),
      );
    },
    ProductListRoute.name: (routeData) {
      final args = routeData.argsAs<ProductListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductListScreen(
          key: args.key,
          sessionId: args.sessionId,
        ),
      );
    },
    SharedCartRoute.name: (routeData) {
      final args = routeData.argsAs<SharedCartRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SharedCartScreen(
          key: args.key,
          sessionId: args.sessionId,
        ),
      );
    },
  };
}

/// generated route for
/// [CartInviteScreen]
class CartInviteRoute extends PageRouteInfo<void> {
  const CartInviteRoute({List<PageRouteInfo>? children})
      : super(
          CartInviteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartInviteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmationScreen]
class ConfirmationRoute extends PageRouteInfo<void> {
  const ConfirmationRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateSessionScreen]
class CreateSessionRoute extends PageRouteInfo<void> {
  const CreateSessionRoute({List<PageRouteInfo>? children})
      : super(
          CreateSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InviteLandingScreen]
class InviteLandingRoute extends PageRouteInfo<InviteLandingRouteArgs> {
  InviteLandingRoute({
    Key? key,
    required String sessionId,
    List<PageRouteInfo>? children,
  }) : super(
          InviteLandingRoute.name,
          args: InviteLandingRouteArgs(
            key: key,
            sessionId: sessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'InviteLandingRoute';

  static const PageInfo<InviteLandingRouteArgs> page =
      PageInfo<InviteLandingRouteArgs>(name);
}

class InviteLandingRouteArgs {
  const InviteLandingRouteArgs({
    this.key,
    required this.sessionId,
  });

  final Key? key;

  final String sessionId;

  @override
  String toString() {
    return 'InviteLandingRouteArgs{key: $key, sessionId: $sessionId}';
  }
}

/// generated route for
/// [JoinSessionScreen]
class JoinSessionRoute extends PageRouteInfo<void> {
  const JoinSessionRoute({List<PageRouteInfo>? children})
      : super(
          JoinSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinSessionWithIdScreen]
class JoinSessionWithIdRoute extends PageRouteInfo<JoinSessionWithIdRouteArgs> {
  JoinSessionWithIdRoute({
    Key? key,
    required String sessionId,
    List<PageRouteInfo>? children,
  }) : super(
          JoinSessionWithIdRoute.name,
          args: JoinSessionWithIdRouteArgs(
            key: key,
            sessionId: sessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinSessionWithIdRoute';

  static const PageInfo<JoinSessionWithIdRouteArgs> page =
      PageInfo<JoinSessionWithIdRouteArgs>(name);
}

class JoinSessionWithIdRouteArgs {
  const JoinSessionWithIdRouteArgs({
    this.key,
    required this.sessionId,
  });

  final Key? key;

  final String sessionId;

  @override
  String toString() {
    return 'JoinSessionWithIdRouteArgs{key: $key, sessionId: $sessionId}';
  }
}

/// generated route for
/// [ProductListScreen]
class ProductListRoute extends PageRouteInfo<ProductListRouteArgs> {
  ProductListRoute({
    Key? key,
    required String sessionId,
    List<PageRouteInfo>? children,
  }) : super(
          ProductListRoute.name,
          args: ProductListRouteArgs(
            key: key,
            sessionId: sessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductListRoute';

  static const PageInfo<ProductListRouteArgs> page =
      PageInfo<ProductListRouteArgs>(name);
}

class ProductListRouteArgs {
  const ProductListRouteArgs({
    this.key,
    required this.sessionId,
  });

  final Key? key;

  final String sessionId;

  @override
  String toString() {
    return 'ProductListRouteArgs{key: $key, sessionId: $sessionId}';
  }
}

/// generated route for
/// [SharedCartScreen]
class SharedCartRoute extends PageRouteInfo<SharedCartRouteArgs> {
  SharedCartRoute({
    Key? key,
    required String sessionId,
    List<PageRouteInfo>? children,
  }) : super(
          SharedCartRoute.name,
          args: SharedCartRouteArgs(
            key: key,
            sessionId: sessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'SharedCartRoute';

  static const PageInfo<SharedCartRouteArgs> page =
      PageInfo<SharedCartRouteArgs>(name);
}

class SharedCartRouteArgs {
  const SharedCartRouteArgs({
    this.key,
    required this.sessionId,
  });

  final Key? key;

  final String sessionId;

  @override
  String toString() {
    return 'SharedCartRouteArgs{key: $key, sessionId: $sessionId}';
  }
}
