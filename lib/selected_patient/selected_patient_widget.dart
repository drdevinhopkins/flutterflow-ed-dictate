import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/select_type_of_note_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../initial_note/initial_note_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedPatientWidget extends StatefulWidget {
  SelectedPatientWidget({
    Key key,
    this.selectedPatient,
  }) : super(key: key);

  final DocumentReference selectedPatient;

  @override
  _SelectedPatientWidgetState createState() => _SelectedPatientWidgetState();
}

class _SelectedPatientWidgetState extends State<SelectedPatientWidget> {
  String genderDropDownValue;
  TextEditingController textController3;
  bool _loadingButton = false;
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PatientsRecord>(
      stream: PatientsRecord.getDocument(widget.selectedPatient),
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
        final selectedPatientPatientsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              '${selectedPatientPatientsRecord.lastName}, ${selectedPatientPatientsRecord.firstName}',
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
              await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SelectTypeOfNoteWidget(
                    patient: widget.selectedPatient,
                  );
                },
              );
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: textController1 ??= TextEditingController(
                            text: selectedPatientPatientsRecord.lastName,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: FlutterFlowTheme.bodyText1,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        TextFormField(
                          controller: textController2 ??= TextEditingController(
                            text: selectedPatientPatientsRecord.firstName,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: FlutterFlowTheme.bodyText1,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController3 ??=
                                    TextEditingController(
                                  text: selectedPatientPatientsRecord.age
                                      .toString(),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Age',
                                  labelStyle: FlutterFlowTheme.bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            FlutterFlowDropDown(
                              initialOption: genderDropDownValue ??=
                                  selectedPatientPatientsRecord.gender,
                              options: ['Male', 'Female', 'Other'].toList(),
                              onChanged: (val) =>
                                  setState(() => genderDropDownValue = val),
                              width: 130,
                              height: 40,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              fillColor: Color(0x00FFFFFF),
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() => _loadingButton = true);
                                try {
                                  final patientsUpdateData =
                                      createPatientsRecordData(
                                    lastName: textController1?.text ?? '',
                                    firstName: textController2?.text ?? '',
                                    age: int.parse(textController3?.text ?? ''),
                                    gender: genderDropDownValue,
                                  );
                                  await selectedPatientPatientsRecord.reference
                                      .update(patientsUpdateData);
                                } finally {
                                  setState(() => _loadingButton = false);
                                }
                              },
                              text: 'Update',
                              options: FFButtonOptions(
                                width: 130,
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
                              loading: _loadingButton,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'Notes',
                      style: FlutterFlowTheme.title3,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<NotesRecord>>(
                      stream: queryNotesRecord(
                        queryBuilder: (notesRecord) => notesRecord
                            .where('patient',
                                isEqualTo:
                                    selectedPatientPatientsRecord.reference)
                            .orderBy('timestamp', descending: true),
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
                        List<NotesRecord> listViewNotesRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotesRecord =
                                listViewNotesRecordList[listViewIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InitialNoteWidget(
                                      selectedNote:
                                          listViewNotesRecord.reference,
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
                                      await listViewNotesRecord.reference
                                          .delete();
                                    },
                                  )
                                ],
                                child: ListTile(
                                  title: Text(
                                    listViewNotesRecord.type,
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
