import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/domain/entities/session.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_text_field.dart';
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
            GlobalTextField(
              labelText: 'Your name',
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
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
                orElse:
                    () => Text(
                      'Create Session',
                      style: appStyle(14, FontWeight.w500, AppColors.white),
                    ),
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
      floatingActionButton: state.maybeMap(
        created:
            (createdState) => FloatingActionButton(
              backgroundColor: AppColors.teal,

              onPressed: () => _shareLink(context, createdState.session.id),
              child: const Icon(Icons.share, color: AppColors.white),
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

class _InviteSection extends StatelessWidget {
  final Session session;

  const _InviteSection({required this.session});

  @override
  Widget build(BuildContext context) {
    final inviteLink = 'app://shop/session/${session.id}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Text('Share this link:'),
        const SizedBox(height: 10),
        SelectableText(
          inviteLink,
          style: appStyle(14, FontWeight.w500, AppColors.black),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                FlutterClipboard.copy(inviteLink);
                Toast.show(
                  context: context,
                  message: 'Link copied to clipboard',
                  type: ToastType.success,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                SharePlus.instance.share(ShareParams(text: inviteLink));
              },
            ),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            context.router.push(ProductListRoute(sessionId: session.id));
          },
          icon: const Icon(Icons.shopping_cart, color: AppColors.white),
          label: Text(
            "Start Shopping",
            style: appStyle(13, FontWeight.w500, AppColors.white),
          ),
        ),
      ],
    );
  }
}
