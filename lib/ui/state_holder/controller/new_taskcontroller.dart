
import 'package:flutter/cupertino.dart';
import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';
import '../model_calsses/newTask_model.dart';

class NewTaskController with ChangeNotifier{
  bool _getNewTaskInProgress = false;
  NewTask _newTask = NewTask();
  NewTask get newtask => _newTask;
  String _errorMessage = '';

  bool get getNewTaskInProgress => _getNewTaskInProgress;
  String get errorMessage => _errorMessage;

  Future<bool>getNewTask()async{
    _getNewTaskInProgress = true;
    notifyListeners();
    final Networkresponse response =await Networkcall.getRequest(Urls.NewTask);
    _getNewTaskInProgress = false;
    if(response.issuccess){
      _newTask = NewTask.fromJson(response.responseJson!);
      _errorMessage='Get Task Successfully';
      notifyListeners();
      return true;
    }else{
      _errorMessage='Get Task Failed';
      notifyListeners();
      return false;
    }
  }
}