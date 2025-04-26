// lib/domain/entities/session.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String hostName,
    String? friendName,
    required bool isActive,
    required DateTime createdAt,
  }) = _Session;

  factory Session.empty() => Session(
        id: '',
        hostName: '',
        isActive: false,
        createdAt: DateTime.now(),
      );
}