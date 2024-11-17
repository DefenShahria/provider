import 'package:flutter/material.dart';
import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';


class AddNewTaskController extends ChangeNotifier {
  bool _newTaskInProgress = false;
  bool get newTaskInProgress => _newTaskInProgress;

  Future<bool> addNewTask(BuildContext context, String title, String des, String status) async {
    _newTaskInProgress = true;
    notifyListeners();

    Networkresponse response = await Networkcall().postRequest(
      Urls.Addtask,
      {
        "title": title,
        "description": des,
        "status": status,
      },
    );

    _newTaskInProgress = false;
    notifyListeners();

    if (response.issuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task added successfully'),
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task add failed'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
