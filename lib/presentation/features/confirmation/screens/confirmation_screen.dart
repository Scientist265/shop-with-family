import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_button.dart';

@RoutePage()
class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thanks for shopping!',
              style: appStyle(20, FontWeight.w500, AppColors.black),
            ),
            20.ht,
            GlobalButton(
              labelText: "Return to Home",
              onPressed: () => context.router.replaceAll([const HomeRoute()]),
            ),
          ],
        ),
      ),
    );
  }
}
