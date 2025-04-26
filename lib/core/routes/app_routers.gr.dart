// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routers.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateSessionScreen(),
      );
    }
  };
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
