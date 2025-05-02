import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/failures/session_failure.dart';
import 'package:sippylife_assesment/domain/repositories/session_repository.dart';

part 'session_view_model.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    required String? sessionId,
    required String? hostName,
    required String? friendName,
    required bool isLoading,
    required Option<SessionFailure> failure,
    required bool canJoin,
    required bool isJoined,
    required List<String> participants,
  }) = _SessionState;

  factory SessionState.initial() => SessionState(
    sessionId: null,
    hostName: null,
    friendName: null,
    isLoading: false,
    failure: const None(),
    canJoin: false,
    isJoined: false,
    participants: [],
  );
}

class SessionViewModel extends StateNotifier<SessionState> {
  final SessionRepository _repository;

  SessionViewModel(this._repository) : super(SessionState.initial());

  void updateFriendName(String name) {
    state = state.copyWith(friendName: name, canJoin: name.isNotEmpty);
  }

  Future<void> createSession(String hostName) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.createSession(hostName);
    state = result.fold(
      (failure) => state.copyWith(isLoading: false, failure: some(failure)),
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

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, failure: some(failure)),
      (_) async {
        final sessionResult = await _repository.getSession(sessionId);

        sessionResult.fold(
          (failure) =>
              state = state.copyWith(isLoading: false, failure: some(failure)),
          (session) =>
              state = state.copyWith(
                isLoading: false,
                sessionId: sessionId,
                friendName: friendName,
                isJoined: true,
              ),
        );
      },
    );
  }

  void resetState() {
    state = SessionState.initial();
  }
}
