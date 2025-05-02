// lib/presentation/features/session/screens/join_session_with_id_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_text_field.dart';
import 'package:sippylife_assesment/presentation/features/session/view_model/session_view_model.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';

@RoutePage()
class JoinSessionWithIdScreen extends ConsumerWidget {
  final String sessionId;

  const JoinSessionWithIdScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sessionViewModelProvider);
    final viewModel = ref.read(sessionViewModelProvider.notifier);

    ref.listen<SessionState>(sessionViewModelProvider, (previous, next) {
      if (next.isJoined && next.sessionId == sessionId) {
        context.router.replace(ProductListRoute(sessionId: sessionId));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Join Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Joining session: $sessionId'),
            20.ht,
            GlobalTextField(
              labelText: 'Your name',
              onChanged: (name) => viewModel.updateFriendName(name),
            ),

            20.ht,

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.teal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed:
                  state.canJoin && !state.isLoading
                      ? () =>
                          viewModel.joinSession(sessionId, state.friendName!)
                      : null,
              child:
                  state.isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : Text(
                        'Start Shopping',
                        style: appStyle(13, FontWeight.w500, AppColors.white),
                      ),
            ),
            if (state.failure.isSome()) ...[
              const SizedBox(height: 16),
              Text(
                state.failure.fold(() => '', (f) => f.message),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
