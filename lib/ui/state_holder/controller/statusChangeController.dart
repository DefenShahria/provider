
import 'package:flutter/cupertino.dart';

import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';

class UpdatePostController with ChangeNotifier{
  bool _getUpdatePostInProgress = false;
  String _errorMessage = '';

  bool get getUpdatePostInProgress => _getUpdatePostInProgress;
  String get errorMessage => _errorMessage;

  Future<bool>updatePost(String taskId, String status)async{
    _getUpdatePostInProgress = true;
    notifyListeners();
    final Networkresponse response =await Networkcall.getRequest(Urls.TaskEdit("$taskId", "$status"));
    _getUpdatePostInProgress = false;
    if(response.issuccess){
      _errorMessage='Task Update Successfully';
      notifyListeners();
      return true;
    }else{
      _errorMessage='Task Update Failed';
      notifyListeners();
      return false;
    }

  }
}