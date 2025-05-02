import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/data/repositories/session_repository_impl.dart';
import 'package:sippylife_assesment/domain/repositories/session_repository.dart';
import 'package:sippylife_assesment/domain/use_cases/create_session.dart';
import 'package:sippylife_assesment/presentation/features/session/view_model/create_session_view_model.dart';
import 'package:sippylife_assesment/providers.dart/session_provider.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return SessionRepositoryImpl(firestore);
});

final createSessionUseCaseProvider = Provider<CreateSession>((ref) {
  return CreateSession(ref.watch(sessionRepositoryProvider));
});

final createSessionViewModelProvider =
    StateNotifierProvider<CreateSessionViewModel, CreateSessionState>((ref) {
  return CreateSessionViewModel(ref.watch(createSessionUseCaseProvider));
});