import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/presentation/features/session/providers/providers.dart';
import 'package:sippylife_assesment/presentation/features/session/view_model/create_session_view_model.dart';

@RoutePage()
class CreateSessionScreen extends ConsumerStatefulWidget {
  static var page;

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
    ref.listen<CreateSessionState>(createSessionViewModelProvider, (
      prev,
      curr,
    ) {
      curr.maybeWhen(
        created: (session) {
          context.router.push(ProductListRoute(sessionId: session.id));
        },
        orElse: () {},
      );
    });

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
                                  Toast.show(
                                    context: context,
                                    message: 'Session ID copied to clipboard',
                                    type: ToastType.success,
                                  );
                                });
                              },
                              icon: const Icon(Icons.copy),
                              label: const Text('Copy ID'),
                            ),
                            const SizedBox(width: 20),
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
      floatingActionButton: state.maybeMap(
        created:
            (createdState) => FloatingActionButton(
              onPressed: () => _shareLink(context, createdState.session.id),
              child: const Icon(Icons.share),
            ),
        orElse: () => null,
      ),
    );
  }

  void _shareLink(BuildContext context, String sessionId) {
    final inviteLink = 'app://shop/session/$sessionId';
    FlutterClipboard.copy(inviteLink);
    Toast.show(
      context: context,
      message: 'Invite link copied to clipboard',
      type: ToastType.success,
    );
    SharePlus.instance.share(ShareParams(text: inviteLink));
  }
}
