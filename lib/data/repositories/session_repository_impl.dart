import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/entities/session.dart';
import 'package:sippylife_assesment/domain/failures/session_failure.dart';
import 'package:sippylife_assesment/domain/repositories/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  final FirebaseFirestore _firestore;

  SessionRepositoryImpl(this._firestore);

  @override
  Future<Either<SessionFailure, Session>> createSession(String hostName) async {
    try {
      final session = Session(
        id: _firestore.collection('sessions').doc().id,
        hostName: hostName,
        isActive: true,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('sessions')
          .doc(session.id)
          .set(session.toJson());
      return right(session);
    } on FirebaseException catch (e) {
      return left(SessionFailure.databaseError(e.message!));
    } catch (e) {
      return left(const SessionFailure.unknownError());
    }
  }

  @override
  Future<Either<SessionFailure, Unit>> joinSession(
    String sessionId,
    String friendName,
  ) async {
    try {
      final doc = await _firestore.collection('sessions').doc(sessionId).get();

      if (!doc.exists) return left(const SessionFailure.notFound());
      if (doc.data()?['isActive'] != true) {
        return left(const SessionFailure.sessionExpired());
      }

      await _firestore.collection('sessions').doc(sessionId).update({
        'friendName': friendName,
        'participants': FieldValue.arrayUnion([friendName]),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(SessionFailure.databaseError(e.message!));
    }
  }

  @override
  Future<Either<SessionFailure, Session>> getSession(String sessionId) async {
    try {
      final doc = await _firestore.collection('sessions').doc(sessionId).get();

      if (!doc.exists) {
        return left(const SessionFailure.notFound());
      }

      return right(Session.fromJson(doc.data()!));
    } on FirebaseException catch (e) {
      return left(SessionFailure.databaseError(e.message!));
    } catch (e) {
      return left(const SessionFailure.unknownError());
    }
  }
}
