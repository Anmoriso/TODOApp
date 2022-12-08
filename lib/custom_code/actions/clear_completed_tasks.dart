// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> clearCompletedTasks(
    List<DocumentReference>? completedTasks) async {
  if (completedTasks == null || completedTasks.isEmpty) {
    return false;
  }
  CollectionReference collectionName =
      FirebaseFirestore.instance.collection('tasks');

  //await Future.forEach(completedTasks, (ref) async {
  //    await collectionName.doc(ref.id).delete();
  //});
  for (var ref in completedTasks) {
    await collectionName.doc(ref.id).delete();
  }
  return true;
}
