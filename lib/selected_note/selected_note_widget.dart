import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedNoteWidget extends StatefulWidget {
  SelectedNoteWidget({
    Key key,
    this.selectedNote,
  }) : super(key: key);

  final DocumentReference selectedNote;

  @override
  _SelectedNoteWidgetState createState() => _SelectedNoteWidgetState();
}

class _SelectedNoteWidgetState extends State<SelectedNoteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NotesRecord>(
      stream: NotesRecord.getDocument(widget.selectedNote),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final selectedNoteNotesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              dateTimeFormat('relative', selectedNoteNotesRecord.timestamp),
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
