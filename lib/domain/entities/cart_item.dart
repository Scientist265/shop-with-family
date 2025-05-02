import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/entities/added_by.dart';
import 'package:sippylife_assesment/domain/entities/product.dart';
part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();
  const factory CartItem({
    required Product product,
    required int quantity,
    required AddedBy addedBy,
    required String addedByName,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}