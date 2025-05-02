import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/core/utils/toast.dart';
import 'package:sippylife_assesment/domain/entities/added_by.dart';
import 'package:sippylife_assesment/domain/entities/cart_item.dart';
import 'package:sippylife_assesment/domain/entities/product.dart';
import 'package:sippylife_assesment/domain/failures/cart_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/repositories/cart_repository.dart';

part 'shared_cart_view_model.freezed.dart';

@freezed
class SharedCartState with _$SharedCartState {
  factory SharedCartState.initial() => SharedCartState(
    items: [],
    hostName: '',
    friendName: "",
    isLoading: false,
    failure: none(),
    totalPrice: 0.0,
  );

  const factory SharedCartState({
    required List<CartItem> items,
    required String hostName,
    required String? friendName,
    required bool isLoading,
    required Option<CartFailure> failure,
    @Default(0.0) double totalPrice,
  }) = _SharedCartState;
}

class SharedCartViewModel extends StateNotifier<SharedCartState> {
  final CartRepository _cartRepository;
  final String _sessionId;
  final String? _friendName; // <-- add this

  StreamSubscription? _cartSubscription;

  SharedCartViewModel(this._cartRepository, this._sessionId, this._friendName)
    : super(SharedCartState.initial()) {
    _subscribeToCart();
  }

  Future<void> completeSession(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _cartRepository.completeSession(_sessionId);
    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: some(failure)),
      (_) => state.copyWith(isLoading: false),
    );

    Toast.show(
      context: context,
      message: result.fold(
        (failure) => 'Failed to complete session: ${failure.message}',
        (_) => 'Session completed successfully',
      ),
      type: ToastType.success,
    );

    _cartSubscription?.cancel();
  }

  void _subscribeToCart() {
    _cartSubscription = _cartRepository.watchCartItems(_sessionId).listen((
      items,
    ) {
      final total = items.fold(
        0.0,
        (sum, item) => sum + (item.product.price * item.quantity),
      );
      state = state.copyWith(items: items, totalPrice: total);
    });
  }

  // double _calculateTotal(List<CartItem> items) {
  //   return items.fold(
  //     0.0,
  //     (total, item) => total + (item.product.price * item.quantity),
  //   );
  // }

  Future<void> addItem(Product product, AddedBy addedBy) async {
    state = state.copyWith(isLoading: true);
    final result = await _cartRepository.addItem(
      _sessionId,
      CartItem(
        product: product,
        quantity: 1,
        addedBy: addedBy,
        addedByName: state.hostName,
      ),
    );
    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: some(failure)),
      (_) => state.copyWith(isLoading: false),
    );
  }

  @override
  void dispose() {
    _cartSubscription?.cancel();
    super.dispose();
  }
}
