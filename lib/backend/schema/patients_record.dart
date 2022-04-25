import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'patients_record.g.dart';

abstract class PatientsRecord
    implements Built<PatientsRecord, PatientsRecordBuilder> {
  static Serializer<PatientsRecord> get serializer =>
      _$patientsRecordSerializer;

  @nullable
  DocumentReference get session;

  @nullable
  DateTime get timestamp;

  @nullable
  int get age;

  @nullable
  String get gender;

  @nullable
  String get cc;

  @nullable
  String get lastName;

  @nullable
  String get firstName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PatientsRecordBuilder builder) => builder
    ..age = 0
    ..gender = ''
    ..cc = ''
    ..lastName = ''
    ..firstName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patients');

  static Stream<PatientsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PatientsRecord._();
  factory PatientsRecord([void Function(PatientsRecordBuilder) updates]) =
      _$PatientsRecord;

  static PatientsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPatientsRecordData({
  DocumentReference session,
  DateTime timestamp,
  int age,
  String gender,
  String cc,
  String lastName,
  String firstName,
}) =>
    serializers.toFirestore(
        PatientsRecord.serializer,
        PatientsRecord((p) => p
          ..session = session
          ..timestamp = timestamp
          ..age = age
          ..gender = gender
          ..cc = cc
          ..lastName = lastName
          ..firstName = firstName));
