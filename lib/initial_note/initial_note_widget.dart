import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialNoteWidget extends StatefulWidget {
  const InitialNoteWidget({
    Key key,
    this.selectedNote,
  }) : super(key: key);

  final DocumentReference selectedNote;

  @override
  _InitialNoteWidgetState createState() => _InitialNoteWidgetState();
}

class _InitialNoteWidgetState extends State<InitialNoteWidget> {
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
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final initialNoteNotesRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              initialNoteNotesRecord.type,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryColor,
                    labelStyle: FlutterFlowTheme.of(context).bodyText1,
                    indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                    tabs: [
                      Tab(),
                      Tab(),
                      Tab(),
                      Tab(),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'Chief Complaint(s)',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            initialNoteNotesRecord.cc,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'History of Present Illness',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            initialNoteNotesRecord.hpi,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'Relevant Past Medical & Surgical History',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              initialNoteNotesRecord.pmhx,
                                              'Healthy',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'Relevant Social History',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              initialNoteNotesRecord.socialhx,
                                              'N/A',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'Allergies',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              initialNoteNotesRecord.allergies,
                                              'NKDA',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AutoSizeText(
                                          'Medications',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              initialNoteNotesRecord.meds,
                                              'See DSQ list',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Tab View 2',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                  ),
                        ),
                        Text(
                          'Tab View 3',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                  ),
                        ),
                        Text(
                          'Tab View 4',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
