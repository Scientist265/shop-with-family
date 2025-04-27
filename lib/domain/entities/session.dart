import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';
@JsonSerializable()
@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String hostName,
    String? friendName,
    required bool isActive,
    required DateTime createdAt,
  }) = _Session;
  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  factory Session.empty() =>
      Session(id: '', hostName: '', isActive: false, createdAt: DateTime.now());
}
