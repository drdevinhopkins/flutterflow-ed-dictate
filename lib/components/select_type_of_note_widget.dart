import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../selected_note/selected_note_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTypeOfNoteWidget extends StatefulWidget {
  const SelectTypeOfNoteWidget({
    Key key,
    this.patient,
  }) : super(key: key);

  final DocumentReference patient;

  @override
  _SelectTypeOfNoteWidgetState createState() => _SelectTypeOfNoteWidgetState();
}

class _SelectTypeOfNoteWidgetState extends State<SelectTypeOfNoteWidget> {
  NotesRecord newDischargeNote;
  NotesRecord newInitialNote;
  NotesRecord newProgressNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: () async {
              final notesCreateData = createNotesRecordData(
                patient: widget.patient,
                timestamp: getCurrentTimestamp,
                type: 'initial',
              );
              var notesRecordReference = NotesRecord.collection.doc();
              await notesRecordReference.set(notesCreateData);
              newInitialNote = NotesRecord.getDocumentFromData(
                  notesCreateData, notesRecordReference);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedNoteWidget(
                    selectedNote: newInitialNote.reference,
                  ),
                ),
              );

              setState(() {});
            },
            text: 'Initial Note',
            options: FFButtonOptions(
              width: double.infinity,
              height: 40,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final notesCreateData = createNotesRecordData(
                  patient: widget.patient,
                  timestamp: getCurrentTimestamp,
                  type: 'progress',
                );
                var notesRecordReference = NotesRecord.collection.doc();
                await notesRecordReference.set(notesCreateData);
                newProgressNote = NotesRecord.getDocumentFromData(
                    notesCreateData, notesRecordReference);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedNoteWidget(
                      selectedNote: newProgressNote.reference,
                    ),
                  ),
                );

                setState(() {});
              },
              text: 'Progress Note',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final notesCreateData = createNotesRecordData(
                  patient: widget.patient,
                  timestamp: getCurrentTimestamp,
                  type: 'discharge',
                );
                var notesRecordReference = NotesRecord.collection.doc();
                await notesRecordReference.set(notesCreateData);
                newDischargeNote = NotesRecord.getDocumentFromData(
                    notesCreateData, notesRecordReference);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedNoteWidget(
                      selectedNote: newDischargeNote.reference,
                    ),
                  ),
                );

                setState(() {});
              },
              text: 'Discharge Note',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
