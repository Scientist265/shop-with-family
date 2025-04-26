import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clipboard/clipboard.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/presentation/features/session/providers/providers.dart';

class CreateSessionScreen extends ConsumerStatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  ConsumerState<CreateSessionScreen> createState() =>
      _CreateSessionScreenState();
}

class _CreateSessionScreenState extends ConsumerState<CreateSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hostNameController = TextEditingController();

  @override
  void dispose() {
    _hostNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSessionViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Shopping Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _hostNameController,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.maybeMap(
                  creating: (_) => null,
                  orElse:
                      () => () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(createSessionViewModelProvider.notifier)
                              .createSession(_hostNameController.text);
                        }
                      },
                ),
                child: state.maybeMap(
                  creating: (_) => const CircularProgressIndicator.adaptive(),
                  orElse: () => const Text('Create Session'),
                ),
              ),
              state.maybeMap(
                created:
                    (createdState) => Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Share this session ID with your friend:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        SelectableText(
                          createdState.session.id,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                FlutterClipboard.copy(
                                  createdState.session.id,
                                ).then((_) {
                                  Toast(context).show(
                                    'Session ID copied to clipboard',
                                    ToastType.success,
                                  );
                                });
                              },
                              icon: const Icon(Icons.copy),
                              label: const Text('Copy ID'),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                Toast(context).show(
                                  'Invite link sent to your email',
                                  ToastType.success,
                                );
                              },
                              icon: const Icon(Icons.email),
                              label: const Text('Send Invite'),
                            ),
                          ],
                        ),
                      ],
                    ),
                error:
                    (errorState) => Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Error: ${errorState.failure.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
