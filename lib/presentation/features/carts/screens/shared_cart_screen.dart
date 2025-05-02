import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/sizing.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/core/theme/colors.dart';
import 'package:sippylife_assesment/core/theme/text_style.dart';
import 'package:sippylife_assesment/core/utils/sheet.dart';
import 'package:sippylife_assesment/domain/entities/added_by.dart';
import 'package:sippylife_assesment/presentation/features/home/widgets/global_button.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';
import 'package:sippylife_assesment/providers.dart/shared_cartviewmodel_provider.dart';

@RoutePage()
class SharedCartScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const SharedCartScreen({super.key, required this.sessionId});

  @override
  ConsumerState<SharedCartScreen> createState() => _SharedCartScreenState();
}

class _SharedCartScreenState extends ConsumerState<SharedCartScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sharedCartViewModelProvider(widget.sessionId));
    final viewModel = ref.read(
      sharedCartViewModelProvider(widget.sessionId).notifier,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Shared Cart')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (ctx, i) {
                  String addedByName = 'Friend';
                  if (state.items[i].addedBy == AddedBy.host) {
                    addedByName = state.hostName;
                  } else if (state.items[i].addedBy == AddedBy.friend &&
                      state.friendName != null) {
                    addedByName = state.friendName!;
                  }

                  return ListTile(
                    title: Row(
                      children: [
                        Text(state.items[i].product.name),
                        Text('x : ${state.items[i].quantity}'),
                      ],
                    ),
                    subtitle: Text(
                      'Added by: ${state.items[i].addedBy == AddedBy.host ? state.hostName : state.friendName ?? "Friend"}',
                    ),

                    trailing: Text(
                      '\$${state.items[i].product.price.toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  GlobalButton(
                    onPressed: () async {
                      final confirmed = Sheet(context).showSheet(
                        style: SheetStyle.blue,
                        (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Complete Shopping',
                                  style: appStyle(
                                    22,
                                    FontWeight.w600,
                                    AppColors.white,
                                  ),
                                ),
                                16.ht,
                                Text(
                                  'This will end the shared session.',
                                  style: appStyle(
                                    14,
                                    FontWeight.w600,
                                    AppColors.white,
                                  ),
                                ),

                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed:
                                            () => Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                    ),
                                    20.wt,
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed:
                                            () => context.router.push(
                                              ConfirmationRoute(),
                                            ),
                                        child: const Text('Confirm'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      if (confirmed == true) {
                        await viewModel.completeSession(context);
                        if (mounted) {
                          context.router.push(const ConfirmationRoute());
                        }
                      }
                    },
                    labelText: "Done Shopping",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
