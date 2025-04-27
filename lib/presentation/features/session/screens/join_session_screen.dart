// lib/presentation/features/session/screens/join_session_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';

@RoutePage()
class JoinSessionScreen extends ConsumerWidget {
  const JoinSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Join Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: sessionIdController,
              decoration: const InputDecoration(
                labelText: 'Enter Session ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (sessionIdController.text.isNotEmpty) {
                  context.router.push(
                    JoinSessionWithIdRoute(sessionId: sessionIdController.text),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}