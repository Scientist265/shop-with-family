// lib/presentation/features/cart/screens/shared_cart_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder:
                  (ctx, i) => ListTile(
                    title: Text(state.items[i].product.name),
                    subtitle: Text('Added by: ${state.items[i].addedBy.name}'),
                    trailing: Text(
                      '\$${state.items[i].product.price.toStringAsFixed(2)}',
                    ),
                  ),
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
                ElevatedButton(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Complete Shopping?'),
                            content: const Text(
                              'This will end the shared session.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                    );

                    if (confirmed == true) {
                      await viewModel.completeSession();
                      if (mounted) {
                        context.router.push(const ConfirmationRoute());
                      }
                    }
                  },
                  child: const Text('Done Shopping'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
