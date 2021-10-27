import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../selected_patient/selected_patient_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedSessionWidget extends StatefulWidget {
  SelectedSessionWidget({
    Key key,
    this.selectedSession,
  }) : super(key: key);

  final DocumentReference selectedSession;

  @override
  _SelectedSessionWidgetState createState() => _SelectedSessionWidgetState();
}

class _SelectedSessionWidgetState extends State<SelectedSessionWidget> {
  PatientsRecord newPatient;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SessionsRecord>(
      stream: SessionsRecord.getDocument(widget.selectedSession),
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
        final selectedSessionSessionsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              dateTimeFormat('MMMEd', selectedSessionSessionsRecord.timestamp),
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
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final patientsCreateData = createPatientsRecordData(
                timestamp: getCurrentTimestamp,
                session: widget.selectedSession,
              );
              final patientsRecordReference = PatientsRecord.collection.doc();
              await patientsRecordReference.set(patientsCreateData);
              newPatient = PatientsRecord.getDocumentFromData(
                  patientsCreateData, patientsRecordReference);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedPatientWidget(
                    selectedPatient: newPatient.reference,
                  ),
                ),
              );

              setState(() {});
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.tertiaryColor,
              size: 24,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'Patients',
                      style: FlutterFlowTheme.title3,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<PatientsRecord>>(
                      stream: queryPatientsRecord(
                        queryBuilder: (patientsRecord) => patientsRecord.where(
                            'session',
                            isEqualTo: selectedSessionSessionsRecord.reference),
                        limit: 10,
                      ),
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
                        List<PatientsRecord> listViewPatientsRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPatientsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPatientsRecord =
                                listViewPatientsRecordList[listViewIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectedPatientWidget(
                                      selectedPatient:
                                          listViewPatientsRecord.reference,
                                    ),
                                  ),
                                );
                              },
                              child: Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Color(0xFFD32F2F),
                                    icon: Icons.delete_outline,
                                    onTap: () async {
                                      await listViewPatientsRecord.reference
                                          .delete();
                                    },
                                  )
                                ],
                                child: ListTile(
                                  title: Text(
                                    '${listViewPatientsRecord.lastName}, ${listViewPatientsRecord.firstName}',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 5),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
