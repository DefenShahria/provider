import 'package:flutter/cupertino.dart';
import '../../../data/urls.dart';
import '../../../network/networkcaller.dart';
import '../../../network/networkresponse.dart';

class DeletPostController with ChangeNotifier{
  bool _getDeletPostInProgress = false;
  String _errorMessage = '';

  bool get getDeletPostInProgress => _getDeletPostInProgress;
  String get errorMessage => _errorMessage;

  Future<bool>deletPost(String taskId)async{
    _getDeletPostInProgress = true;
    notifyListeners();
    final Networkresponse response =await Networkcall.getRequest(Urls.TaskDelet("$taskId"));
    _getDeletPostInProgress = false;
    if(response.issuccess){
      _errorMessage='Task delete Successfully';
      notifyListeners();
      return true;
    }else{
      _errorMessage='Task delete Failed';
      notifyListeners();
      return false;
    }

  }
}