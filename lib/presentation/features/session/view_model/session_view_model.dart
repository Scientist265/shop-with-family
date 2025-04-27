// lib/presentation/features/session/view_models/session_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/failures/session_failure.dart';
import 'package:sippylife_assesment/domain/repositories/session_repository.dart';

part 'session_view_model.freezed.dart';

// @freezed
// class SessionState with _$SessionState {
//   const factory SessionState({
//     required String hostName,
//     required String? friendName,
//     required bool isLoading,
//     required Option<SessionFailure> failure,
//     required bool canJoin,
//   }) = _SessionState;

//   factory SessionState.initial() => SessionState(
//     hostName: '',
//     friendName: null,
//     isLoading: false,
//     failure: none(),
//     canJoin: false,
//   );
// }

// class SessionViewModel extends StateNotifier<SessionState> {
//   final SessionRepository _repository;

//   SessionViewModel(this._repository) : super(SessionState.initial());
//   void updateFriendName(String name) {
//     state = state.copyWith(friendName: name, canJoin: name.isNotEmpty);
//   }

//   Future<void> joinSession(String sessionId, String friendName) async {
//     state = state.copyWith(isLoading: true);
//     final result = await _repository.joinSession(sessionId, friendName);
//     state = result.fold(
//       (failure) => state.copyWith(
//         isLoading: false,
//         failure: some(failure),
//       ),
//       (_) => state.copyWith(
//         isLoading: false,
//         friendName: friendName,
//       ),
//     );
//   }
// }




@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    required String? sessionId,
    required String? hostName,
    required String? friendName,
    required bool isLoading,
    required Option<SessionFailure> failure,
    required bool canJoin,
  }) = _SessionState;

  factory SessionState.initial() => SessionState(
        sessionId: null,
        hostName: null,
        friendName: null,
        isLoading: false,
        failure: const None(),
        canJoin: false,
      );
}

class SessionViewModel extends StateNotifier<SessionState> {
  final SessionRepository _repository;

  SessionViewModel(this._repository) : super(SessionState.initial());

  void updateFriendName(String name) {
    state = state.copyWith(
      friendName: name,
      canJoin: name.isNotEmpty,
    );
  }

  Future<void> createSession(String hostName) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.createSession(hostName);
    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        failure: some(failure),
      ),
      (session) => state.copyWith(
        isLoading: false,
        sessionId: session.id,
        hostName: session.hostName,
      ),
    );
  }

  Future<void> joinSession(String sessionId, String friendName) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.joinSession(sessionId, friendName);
    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        failure: some(failure),
      ),
      (_) => state.copyWith(
        isLoading: false,
        sessionId: sessionId,
        friendName: friendName,
      ),
    );
  }
}