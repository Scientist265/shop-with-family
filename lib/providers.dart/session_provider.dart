// lib/providers/session_providers.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/data/repositories/session_repository_impl.dart';
import 'package:sippylife_assesment/domain/repositories/session_repository.dart';
import 'package:sippylife_assesment/presentation/features/session/view_model/session_view_model.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepositoryImpl(ref.watch(firestoreProvider));
});

final sessionViewModelProvider = StateNotifierProvider<SessionViewModel, SessionState>((ref) {
  return SessionViewModel(ref.watch(sessionRepositoryProvider));
});