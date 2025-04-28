import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/domain/entities/session.dart';
import 'package:sippylife_assesment/presentation/features/session/providers/providers.dart';

@RoutePage()
class CartInviteScreen extends ConsumerWidget {
  const CartInviteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createSessionViewModelProvider);
    final notifier = ref.read(createSessionViewModelProvider.notifier);
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Create Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: state.maybeMap(
                creating: (_) => null,
                orElse:
                    () => () {
                      if (nameController.text.isNotEmpty) {
                        notifier.createSession(nameController.text);
                      }
                    },
              ),
              child: state.maybeMap(
                creating: (_) => const CircularProgressIndicator.adaptive(),
                orElse: () => const Text('Create Session'),
              ),
            ),
            state.maybeMap(
              created: (s) => _InviteSection(session: s.session),
              error: (e) => Text(e.failure.message),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InviteSection extends StatelessWidget {
  final Session session;

  const _InviteSection({required this.session});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text('Share this link:'),
        const SizedBox(height: 10),
        SelectableText(
          'app://shop/session/${session.id}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                FlutterClipboard.copy(session.id);
                Toast(
                  context,
                ).show('Session ID copied to clipboard', ToastType.success);
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Toast(
                  context,
                ).show('Invite link sent to your email', ToastType.success);
              },
            ),
          ],
        ),
      ],
    );
  }
}
