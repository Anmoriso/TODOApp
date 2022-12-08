import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({Key? key}) : super(key: key);

  @override
  _HomePageCopyWidgetState createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  Map<TasksRecord, bool> checkboxValueMap = {};
  List<TasksRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TasksRecord>>(
      stream: queryTasksRecord(),
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
        List<TasksRecord> homePageCopyTasksRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/logo_no_fill.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
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
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Statistics');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.bar_chart,
                          color: Colors.black,
                          size: 24,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Text(
                            'Statistics',
                            style: FlutterFlowTheme.of(context).bodyText1,
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
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.menu,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40,
              ),
              onPressed: () async {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            title: Text(
              'Todo',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: FlutterFlowDropDown<String>(
                  initialOption: dropDownValue ??= 'Completed',
                  options: ['All', 'Active', 'Completed'],
                  onChanged: (val) => setState(() => dropDownValue = val),
                  width: 150,
                  height: 60,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                  icon: Icon(
                    Icons.filter_list_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 40,
                  ),
                  fillColor: Color(0xFFD3D3D3),
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 6, 12, 6),
                  hidesUnderline: true,
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.more_vert,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 40,
                ),
                onPressed: () async {
                  setState(
                      () => FFAppState().showMenu = !FFAppState().showMenu);
                },
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (homePageCopyTasksRecordList
                              .where((e) => () {
                                    if (dropDownValue == 'All') {
                                      return (e != null);
                                    } else if (dropDownValue == 'Active') {
                                      return !e.checked!;
                                    } else {
                                      return e.checked!;
                                    }
                                  }())
                              .toList()
                              .length !=
                          0)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Text(
                                'All Tasks',
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                            ),
                          ],
                        ),
                      Builder(
                        builder: (context) {
                          final taskList = homePageCopyTasksRecordList
                              .where((e) => () {
                                    if (dropDownValue == 'All') {
                                      return (e != null);
                                    } else if (dropDownValue == 'Active') {
                                      return !e.checked!;
                                    } else {
                                      return e.checked!;
                                    }
                                  }())
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: taskList.length,
                            itemBuilder: (context, taskListIndex) {
                              final taskListItem = taskList[taskListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32, 8, 32, 32),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            Color(0xFFD3D3D3),
                                      ),
                                      child: Checkbox(
                                        value:
                                            checkboxValueMap[taskListItem] ??=
                                                taskListItem.checked!,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              checkboxValueMap[taskListItem] =
                                                  newValue!);
                                          if (newValue!) {
                                            final tasksUpdateData =
                                                createTasksRecordData(
                                              checked: true,
                                            );
                                            await taskListItem.reference
                                                .update(tasksUpdateData);
                                          } else {
                                            final tasksUpdateData =
                                                createTasksRecordData(
                                              checked: false,
                                            );
                                            await taskListItem.reference
                                                .update(tasksUpdateData);
                                          }
                                        },
                                        activeColor: Color(0xFF008200),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'TaskDetails',
                                            queryParams: {
                                              'taskRef': serializeParam(
                                                taskListItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Text(
                                          taskListItem.title!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Spacer(),
                      if (homePageCopyTasksRecordList
                              .where((e) => () {
                                    if (dropDownValue == 'All') {
                                      return (e != null);
                                    } else if (dropDownValue == 'Active') {
                                      return !e.checked!;
                                    } else {
                                      return e.checked!;
                                    }
                                  }())
                              .toList()
                              .length ==
                          0)
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo_no_fill.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'No Tasks available',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                fillColor: Color(0xFF008200),
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0xFFD3D3D3),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  context.pushNamed('AddTask');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (FFAppState().showMenu)
                    Align(
                      alignment: AlignmentDirectional(1.03, -1.01),
                      child: Container(
                        width: 150,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x3B1D2429),
                              offset: Offset(0, -3),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Clear completed',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Refresh',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
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
          ),
        );
      },
    );
  }
}
