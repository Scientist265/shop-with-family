import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/failures/session_failure.dart';
import '../entities/session.dart';


abstract class SessionRepository {
  Future<Either<SessionFailure, Session>> createSession(String hostName);
  Future<Either<SessionFailure, Unit>> joinSession(String sessionId, String friendName);
  Future<Either<SessionFailure, Session>> getSession(String sessionId);

}