import 'package:auto_route/auto_route.dart';
import '../../presentation/features/session/screens/create_session_screen.dart';

part 'app_routers.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CreateSessionRoute.page, initial: true),
  ];
}
