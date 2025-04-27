import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/presentation/features/carts/view_models/shared_cart_view_model.dart';
import 'package:sippylife_assesment/providers.dart/cart_provider.dart';

final sharedCartViewModelProvider =
    StateNotifierProvider.family<SharedCartViewModel, SharedCartState, String>((
      ref,
      sessionId,
    ) {
      return SharedCartViewModel(ref.watch(cartRepositoryProvider), sessionId);
    });
