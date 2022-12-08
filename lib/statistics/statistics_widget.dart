import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({Key? key}) : super(key: key);

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xFF072632),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_no_fill.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'TODO',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: InkWell(
                onTap: () async {
                  context.pushNamed('HomePage');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.tasks,
                      color: Colors.black,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Text(
                        'Task List',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: InkWell(
                onTap: () async {
                  context.pushNamed('Statistics');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Text(
                        'Statistics',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFD3D3D3),
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.menu,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          'Statistics',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Active tasks: ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'percent',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      '%',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Completed tasks: ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'percent',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      '%',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
