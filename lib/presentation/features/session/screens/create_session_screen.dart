import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/core/utils/sheet.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_button.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_text_field.dart';
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
      // curr.maybeWhen(
      //   created: (session) {
      //     context.router.push(ProductListRoute(sessionId: session.id));
      //   },
      //   orElse: () {},
      // );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Create Shopping Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GlobalTextField(
                labelText: 'Your name',
                controller: _hostNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              20.ht,

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
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: state.maybeMap(
                  creating: (_) => const CircularProgressIndicator.adaptive(),
                  orElse:
                      () => Text(
                        'Create Session',
                        style: appStyle(13, FontWeight.w500, AppColors.white),
                      ),
                ),
              ),
              state.maybeMap(
                created:
                    (createdState) => Column(
                      children: [
                        30.ht,
                        Text(
                          'Share this session ID with your friend:',
                          style: appStyle(13, FontWeight.w400, AppColors.black),
                        ),
                        10.ht,
                        SelectableText(
                          createdState.session.id,
                          style: appStyle(16, FontWeight.w500, AppColors.black),
                        ),
                        20.ht,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlobalButton(
                              labelText: "Copy ID",
                              icon: Icons.copy,
                              onPressed: () {
                                FlutterClipboard.copy(
                                  createdState.session.id,
                                ).then((_) {
                                  _hostNameController.text.isEmpty
                                      ? Toast.show(
                                        context: context,
                                        message: "Invalid code",
                                        type: ToastType.error,
                                      )
                                      : Toast.show(
                                        context: context,
                                        message: 'ID copied to clipboard',
                                        type: ToastType.success,
                                      );
                                });
                              },
                            ),

                            20.ht,
                            GlobalButton(
                              labelText: "Start Shopping",
                              icon: Icons.shopping_cart,
                              onPressed: () {
                                context.router.push(
                                  ProductListRoute(
                                    sessionId: createdState.session.id,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                error:
                    (errorState) => Sheet(context).showSheet(
                      style: SheetStyle.red,
                      (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              20.ht,
                              Text(
                                'Error: ${errorState.failure.message}',
                                style: const TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        );
                      },
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
