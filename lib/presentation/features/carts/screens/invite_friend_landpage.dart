import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_text_field.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';

@RoutePage()
class InviteLandingScreen extends ConsumerWidget {
  final String sessionId;
  const InviteLandingScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionVM = ref.watch(sessionViewModelProvider);
    final notifier = ref.watch(sessionViewModelProvider.notifier);
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Join Shopping Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your friend is inviting you to shop!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            30.ht,
            GlobalTextField(
              labelText: 'Your name',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onChanged: (value) => notifier.updateFriendName(value),
            ),
            20.ht,
            ElevatedButton(
              onPressed:
                  sessionVM.canJoin && !sessionVM.isLoading
                      ? () =>
                          notifier.joinSession(sessionId, nameController.text)
                      : null,
              child:
                  sessionVM.isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('Start Shopping'),
            ),
            Text(
              sessionVM.failure.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}
