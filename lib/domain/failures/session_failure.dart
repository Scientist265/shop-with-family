import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_failure.freezed.dart';

@freezed
class SessionFailure with _$SessionFailure {
  const SessionFailure._();

  // Failure types
  const factory SessionFailure.creationFailed() = _CreationFailed;
  const factory SessionFailure.sessionExpired() = _SessionExpired;
  const factory SessionFailure.notFound() = _NotFound;
  const factory SessionFailure.permissionDenied() = _PermissionDenied;
  const factory SessionFailure.unknownError() = _UnknownError;

  String get message => when(
        creationFailed: () => 'Failed to create session',
        sessionExpired: () => 'Session has expired',
        notFound: () => 'Session not found',
        permissionDenied: () => 'Permission denied',
        unknownError: () => 'An unknown error occurred',
      );
}