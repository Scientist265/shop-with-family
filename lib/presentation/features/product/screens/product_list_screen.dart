import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/core/extensions/error_handler.dart';
import 'package:sippylife_assesment/core/routes/app_router.dart';
import 'package:sippylife_assesment/domain/entities/added_by.dart';
import 'package:sippylife_assesment/presentation/features/product/widgets/product_tile.dart';
import 'package:sippylife_assesment/providers.dart/product_provider.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';
import 'package:sippylife_assesment/providers.dart/shared_cartviewmodel_provider.dart';


@RoutePage()
class ProductListScreen extends ConsumerWidget {
  final String sessionId;

  const ProductListScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionProvider(sessionId));
    final products = ref.watch(productListProvider);
    final cartViewModel = ref.read(
      sharedCartViewModelProvider(sessionId).notifier,
    );
    sessionAsync.showAlertDialogOnError(context);
    return Scaffold(
      appBar: AppBar(
        title: sessionAsync.when(
          data: (session) => Text('Shopping with ${session.hostName}'),
          loading: () => const Text('Loading session...'),
          error: (error, _) => const Text('Products'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: products.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data:
              (either) => either.fold(
                (failure) =>
                    Center(child: Text('Failed to load: ${failure.message}')),
                (products) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: products.length,
                  itemBuilder:
                      (ctx, i) => ProductTile(
                        product: products[i],
                        onAdd:
                            () => cartViewModel.addItem(
                              products[i],
                              AddedBy.friend,
                            ),
                      ),
                ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => context.router.push(SharedCartRoute(sessionId: sessionId)),
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
