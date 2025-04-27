import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_failure.freezed.dart';

@freezed
class SessionFailure with _$SessionFailure {
  const SessionFailure._();
  const factory SessionFailure.databaseError(String? message) = _DatabaseError;
  const factory SessionFailure.notFound() = _NotFound;
  const factory SessionFailure.sessionExpired() = _SessionExpired;
  const factory SessionFailure.unknownError() = _UnknownError;

  String get message => when(
        databaseError: (message) => message ?? 'Database error occurred',
        notFound: () => 'Session not found',
        sessionExpired: () => 'Session has expired',
        unknownError: () => 'Unknown error occurred',
      );
}