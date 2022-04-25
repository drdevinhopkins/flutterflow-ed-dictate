import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../phone_auth/phone_auth_widget.dart';
import '../selected_session/selected_session_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  SessionsRecord newSession;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhoneAuthWidget(),
                  ),
                  (r) => false,
                );
              },
              child: Icon(
                Icons.logout,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final sessionsCreateData = createSessionsRecordData(
            user: currentUserReference,
            timestamp: getCurrentTimestamp,
          );
          var sessionsRecordReference = SessionsRecord.collection.doc();
          await sessionsRecordReference.set(sessionsCreateData);
          newSession = SessionsRecord.getDocumentFromData(
              sessionsCreateData, sessionsRecordReference);
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedSessionWidget(
                selectedSession: newSession.reference,
              ),
            ),
          );

          setState(() {});
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).tertiaryColor,
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
                  'Sessions',
                  style: FlutterFlowTheme.of(context).title1,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<SessionsRecord>>(
                  stream: querySessionsRecord(
                    queryBuilder: (sessionsRecord) => sessionsRecord
                        .where('user', isEqualTo: currentUserReference),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<SessionsRecord> listViewSessionsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewSessionsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewSessionsRecord =
                            listViewSessionsRecordList[listViewIndex];
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedSessionWidget(
                                  selectedSession:
                                      listViewSessionsRecord.reference,
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
                                  await listViewSessionsRecord.reference
                                      .delete();
                                },
                              ),
                            ],
                            child: ListTile(
                              title: Text(
                                dateTimeFormat(
                                    'MMMEd', listViewSessionsRecord.timestamp),
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF303030),
                                size: 20,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
