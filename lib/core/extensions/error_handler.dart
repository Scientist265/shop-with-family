import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/domain/entities/session.dart';

extension AsyncValueUI on AsyncValue<Session> {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Session Error'),
              content: Text(error.toString()),
              actions: [
                TextButton(
                  onPressed:
                      () => context.router.replaceAll([const HomeRoute()]),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}
