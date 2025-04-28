import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/use_cases/create_session.dart';
import '../../../../domain/entities/session.dart';
import '../../../../domain/failures/session_failure.dart';
part 'create_session_view_model.freezed.dart';

@freezed
class CreateSessionState with _$CreateSessionState {
  const factory CreateSessionState.initial() = _Initial;
  const factory CreateSessionState.creating() = _Creating;
  const factory CreateSessionState.created(Session session) = _Created;
  const factory CreateSessionState.error(SessionFailure failure) = _Error;
}

class CreateSessionViewModel extends StateNotifier<CreateSessionState> {
  final CreateSession _createSession;

  CreateSessionViewModel(this._createSession)
      : super(const CreateSessionState.initial());

  Future<void> createSession(String hostName) async {
    state = const CreateSessionState.creating();
    final result = await _createSession.execute(hostName);
    state = result.fold(
      (failure) => CreateSessionState.error(failure),
      (session) => CreateSessionState.created(session),
    );
  }
}