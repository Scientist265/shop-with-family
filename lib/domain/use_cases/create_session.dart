import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/failures/session_failure.dart';
import '../entities/session.dart';
import '../repositories/session_repository.dart';

class CreateSession {
  final SessionRepository repository;
  CreateSession(this.repository);

  Future<Either<SessionFailure, Session>> execute(String hostName) async {
    return repository.createSession(hostName);
  }
}
