import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_button.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_text_field.dart';

@RoutePage()
class JoinSessionScreen extends ConsumerWidget {
  const JoinSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Join Session',
          style: appStyle(16, FontWeight.w500, AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            GlobalTextField(
              labelText: 'Enter Session ID',
              controller: sessionIdController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Session ID';
                }
                return null;
              },
            ),

            20.ht,
            GlobalButton(
              labelText: "Continue",
              onPressed: () {
                if (sessionIdController.text.isNotEmpty) {
                  context.router.push(
                    JoinSessionWithIdRoute(sessionId: sessionIdController.text),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
