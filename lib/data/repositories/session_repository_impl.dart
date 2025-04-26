// lib/data/repositories/session_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/session_repository.dart';
import '../../domain/failures/session_failure.dart';

class SessionRepositoryImpl implements SessionRepository {
  @override
  Future<Either<SessionFailure, Session>> createSession(String hostName) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      final session = Session(
        id: const Uuid().v4(),
        hostName: hostName,
        isActive: true,
        createdAt: DateTime.now(),
      );
      
      return right(session);
    } catch (e) {
      return left(const SessionFailure.creationFailed());
    }
  }

  @override
  Future<Either<SessionFailure, Unit>> saveSession(Session session) async {
    try {
      // In a real app, this would persist to local storage or backend
      await Future.delayed(const Duration(milliseconds: 300));
      return right(unit);
    } catch (e) {
      return left(const SessionFailure.unknownError());
    }
  }
}