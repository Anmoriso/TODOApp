import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Map<TasksRecord, bool> checkboxValueMap = {};
  List<TasksRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

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
        List<TasksRecord> homePageTasksRecordList = snapshot.data!;
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Text(
                            'Task List',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
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
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.filter_list_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 40,
                ),
                onPressed: () async {
                  setState(
                      () => FFAppState().showFilter = !FFAppState().showFilter);
                  setState(() => FFAppState().showMenu = false);
                },
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
                  setState(() => FFAppState().showFilter = false);
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
                  InkWell(
                    onTap: () async {
                      setState(() => FFAppState().showMenu = false);
                      setState(() => FFAppState().showFilter = false);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (homePageTasksRecordList
                                .where((e) => () {
                                      if (FFAppState().FilterOption == 'All') {
                                        return (e != null);
                                      } else if (FFAppState().FilterOption ==
                                          'Active') {
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
                                    16, 16, 0, 16),
                                child: Text(
                                  FFAppState().FilterOption,
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ),
                              Text(
                                ' Tasks',
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                            ],
                          ),
                        Builder(
                          builder: (context) {
                            final taskList = homePageTasksRecordList
                                .where((e) => () {
                                      if (FFAppState().FilterOption == 'All') {
                                        return (e != null);
                                      } else if (FFAppState().FilterOption ==
                                          'Active') {
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
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Task marked complete',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              );

                                              final tasksUpdateData =
                                                  createTasksRecordData(
                                                checked: true,
                                              );
                                              await taskListItem.reference
                                                  .update(tasksUpdateData);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Task marked active',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              );

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
                        if ((homePageTasksRecordList
                                    .where((e) => () {
                                          if (FFAppState().FilterOption ==
                                              'All') {
                                            return (e != null);
                                          } else if (FFAppState()
                                                  .FilterOption ==
                                              'Active') {
                                            return !e.checked!;
                                          } else {
                                            return e.checked!;
                                          }
                                        }())
                                    .toList()
                                    .length ==
                                0) &&
                            (FFAppState().FilterOption == 'Completed'))
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shield,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 60,
                                ),
                                Text(
                                  'You have no  completed tasks!',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        if ((homePageTasksRecordList
                                    .where((e) => () {
                                          if (FFAppState().FilterOption ==
                                              'All') {
                                            return (e != null);
                                          } else if (FFAppState()
                                                  .FilterOption ==
                                              'Active') {
                                            return !e.checked!;
                                          } else {
                                            return e.checked!;
                                          }
                                        }())
                                    .toList()
                                    .length ==
                                0) &&
                            (FFAppState().FilterOption == 'Active'))
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 60,
                                ),
                                Text(
                                  'You have no active tasks!',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        if ((homePageTasksRecordList
                                    .where((e) => () {
                                          if (FFAppState().FilterOption ==
                                              'All') {
                                            return (e != null);
                                          } else if (FFAppState()
                                                  .FilterOption ==
                                              'Active') {
                                            return !e.checked!;
                                          } else {
                                            return e.checked!;
                                          }
                                        }())
                                    .toList()
                                    .length ==
                                0) &&
                            (FFAppState().FilterOption == 'All'))
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
                                  'You have no tasks!',
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                  ),
                  if (FFAppState().showMenu)
                    Align(
                      alignment: AlignmentDirectional(1.03, -1.01),
                      child: Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await actions.clearCompletedTasks(
                                  homePageTasksRecordList
                                      .where((e) => e.checked!)
                                      .toList()
                                      .map((e) => e.reference)
                                      .toList(),
                                );
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
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Refresh pressed ...');
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
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (FFAppState().showFilter)
                    Align(
                      alignment: AlignmentDirectional(0.74, -1),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(
                                      () => FFAppState().FilterOption = 'All');
                                  setState(
                                      () => FFAppState().showFilter = false);
                                },
                                text: 'All',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 45,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().FilterOption = 'Active');
                                  setState(
                                      () => FFAppState().showFilter = false);
                                },
                                text: 'Active',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() =>
                                      FFAppState().FilterOption = 'Completed');
                                  setState(
                                      () => FFAppState().showFilter = false);
                                },
                                text: 'Completed',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
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
