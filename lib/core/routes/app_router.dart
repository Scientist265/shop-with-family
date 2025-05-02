import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sippylife_assesment/presentation/features/carts/screens/cart_invite_screen.dart';
import 'package:sippylife_assesment/presentation/features/carts/screens/invite_friend_landpage.dart';
import 'package:sippylife_assesment/presentation/features/carts/screens/shared_cart_screen.dart';
import 'package:sippylife_assesment/presentation/features/confirmation/screens/confirmation_screen.dart';
import 'package:sippylife_assesment/presentation/features/home/screens/home_screen.dart';
import 'package:sippylife_assesment/presentation/features/product/screens/product_list_screen.dart';
import 'package:sippylife_assesment/presentation/features/session/screens/join_session_screen.dart';
import 'package:sippylife_assesment/presentation/features/session/screens/join_session_with_id_screen.dart';
import '../../presentation/features/session/screens/create_session_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: CreateSessionRoute.page),
    AutoRoute(page: CartInviteRoute.page),
    AutoRoute(page: JoinSessionRoute.page),
    AutoRoute(page: JoinSessionWithIdRoute.page, path: '/session/:sessionId'),
    AutoRoute(page: ProductListRoute.page, path: '/products/:sessionId'),
    AutoRoute(page: SharedCartRoute.page, path: '/cart/:sessionId'),
    AutoRoute(page: ConfirmationRoute.page),
    AutoRoute(page: InviteLandingRoute.page, path: '/invite/:sessionId'),
  ];
}
