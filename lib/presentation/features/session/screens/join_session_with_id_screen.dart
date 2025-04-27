// lib/presentation/features/session/screens/join_session_with_id_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';

@RoutePage()
class JoinSessionWithIdScreen extends ConsumerWidget {
  final String sessionId;

  const JoinSessionWithIdScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sessionViewModelProvider);
    final viewModel = ref.read(sessionViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Join Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Join session: $sessionId'),
            TextField(
              decoration: const InputDecoration(labelText: 'Your Name'),
              onChanged: (name) => viewModel.updateFriendName(name),
            ),
            ElevatedButton(
              onPressed:
                  state.canJoin && !state.isLoading
                      ? () =>
                          viewModel.joinSession(sessionId, state.friendName!)
                      : null,
              child:
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Join Session'),
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
