import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sessions_record.g.dart';

abstract class SessionsRecord
    implements Built<SessionsRecord, SessionsRecordBuilder> {
  static Serializer<SessionsRecord> get serializer =>
      _$sessionsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SessionsRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SessionsRecord._();
  factory SessionsRecord([void Function(SessionsRecordBuilder) updates]) =
      _$SessionsRecord;

  static SessionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSessionsRecordData({
  DocumentReference user,
  DateTime timestamp,
}) =>
    serializers.toFirestore(
        SessionsRecord.serializer,
        SessionsRecord((s) => s
          ..user = user
          ..timestamp = timestamp));
