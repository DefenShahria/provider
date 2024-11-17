
import 'package:flutter/cupertino.dart';
import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';
import '../model_calsses/completedTask_model.dart';

class CompleteTaskController with ChangeNotifier{
  bool _getCompleteTaskInProgress = false;
  CompletedTask _completedTask = CompletedTask();
  CompletedTask get completedtask => _completedTask;
  String _errorMessage = '';

  bool get getNewTaskInProgress => _getCompleteTaskInProgress;
  String get errorMessage => _errorMessage;

  Future<bool>getCompleteTask()async{
    _getCompleteTaskInProgress = true;
    notifyListeners();
    final Networkresponse response =await Networkcall.getRequest(Urls.CompletedTask);
    _getCompleteTaskInProgress = false;
    if(response.issuccess){
      _completedTask = CompletedTask.fromJson(response.responseJson!);
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