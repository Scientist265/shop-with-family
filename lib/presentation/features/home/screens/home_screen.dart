import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_button.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Shop With Friends',
          style: appStyle(18, FontWeight.w500, AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlobalButton(
                  labelText: "Create Session",
                  onPressed:
                      () => context.router.push(const CreateSessionRoute()),
                ),
                20.ht,
                GlobalButton(
                  labelText: 'Join Existing Session',
                  onPressed:
                      () => context.router.push(const JoinSessionRoute()),
                ),
              ],
            ),
            20.ht,
            GlobalButton(
              labelText: 'Join as Friend',
              onPressed: () => context.router.push(CartInviteRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
