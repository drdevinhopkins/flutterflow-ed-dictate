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
  SelectTypeOfNoteWidget({
    Key key,
    this.patient,
  }) : super(key: key);

  final DocumentReference patient;

  @override
  _SelectTypeOfNoteWidgetState createState() => _SelectTypeOfNoteWidgetState();
}

class _SelectTypeOfNoteWidgetState extends State<SelectTypeOfNoteWidget> {
  NotesRecord newDischargeNote;
  bool _loadingButton3 = false;
  NotesRecord newInitialNote;
  bool _loadingButton1 = false;
  NotesRecord newProgressNote;
  bool _loadingButton2 = false;

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
              setState(() => _loadingButton1 = true);
              try {
                final notesCreateData = createNotesRecordData(
                  patient: widget.patient,
                  timestamp: getCurrentTimestamp,
                  type: 'initial',
                );
                final notesRecordReference = NotesRecord.collection.doc();
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
              } finally {
                setState(() => _loadingButton1 = false);
              }
            },
            text: 'Initial Note',
            options: FFButtonOptions(
              width: double.infinity,
              height: 40,
              color: FlutterFlowTheme.primaryColor,
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
            loading: _loadingButton1,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton2 = true);
                try {
                  final notesCreateData = createNotesRecordData(
                    patient: widget.patient,
                    timestamp: getCurrentTimestamp,
                    type: 'progress',
                  );
                  final notesRecordReference = NotesRecord.collection.doc();
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
                } finally {
                  setState(() => _loadingButton2 = false);
                }
              },
              text: 'Progress Note',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton2,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton3 = true);
                try {
                  final notesCreateData = createNotesRecordData(
                    patient: widget.patient,
                    timestamp: getCurrentTimestamp,
                    type: 'discharge',
                  );
                  final notesRecordReference = NotesRecord.collection.doc();
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
                } finally {
                  setState(() => _loadingButton3 = false);
                }
              },
              text: 'Discharge Note',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton3,
            ),
          )
        ],
      ),
    );
  }
}
