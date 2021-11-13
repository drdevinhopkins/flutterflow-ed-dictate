import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notes_record.g.dart';

abstract class NotesRecord implements Built<NotesRecord, NotesRecordBuilder> {
  static Serializer<NotesRecord> get serializer => _$notesRecordSerializer;

  @nullable
  DocumentReference get patient;

  @nullable
  DateTime get timestamp;

  @nullable
  String get type;

  @nullable
  String get cc;

  @nullable
  String get hpi;

  @nullable
  String get pmhx;

  @nullable
  String get socialhx;

  @nullable
  String get allergies;

  @nullable
  String get meds;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NotesRecordBuilder builder) => builder
    ..type = ''
    ..cc = ''
    ..hpi = ''
    ..pmhx = ''
    ..socialhx = ''
    ..allergies = ''
    ..meds = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NotesRecord._();
  factory NotesRecord([void Function(NotesRecordBuilder) updates]) =
      _$NotesRecord;

  static NotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNotesRecordData({
  DocumentReference patient,
  DateTime timestamp,
  String type,
  String cc,
  String hpi,
  String pmhx,
  String socialhx,
  String allergies,
  String meds,
}) =>
    serializers.toFirestore(
        NotesRecord.serializer,
        NotesRecord((n) => n
          ..patient = patient
          ..timestamp = timestamp
          ..type = type
          ..cc = cc
          ..hpi = hpi
          ..pmhx = pmhx
          ..socialhx = socialhx
          ..allergies = allergies
          ..meds = meds));
