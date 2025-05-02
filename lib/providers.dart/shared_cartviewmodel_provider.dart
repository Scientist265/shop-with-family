import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/presentation/features/carts/view_models/shared_cart_view_model.dart';
import 'package:sippylife_assesment/providers.dart/cart_provider.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';

final sharedCartViewModelProvider =
    StateNotifierProvider.family<SharedCartViewModel, SharedCartState, String>((
      ref,
      sessionId,
    ) {
      final sessionAsync = ref.watch(sessionProvider(sessionId));

      return sessionAsync.maybeWhen(
        data:
            (session) => SharedCartViewModel(
              ref.watch(cartRepositoryProvider),
              sessionId,
              session.friendName,
            ),
        orElse:
            () => SharedCartViewModel(
              ref.watch(cartRepositoryProvider),
              sessionId,
              null,
            ),
      );
    });
