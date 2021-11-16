import 'dart:async';

import 'package:rasid_jack/base/dialog/data_models/alert_request.dart';
import 'package:rasid_jack/base/dialog/data_models/alert_response.dart';


class DialogService {
   late Function(AlertRequest) _showDialogListener;
   Completer<AlertResponse>? _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog(
      {required String title, required String description, required String okButtonTitle, String? cancelButtonTitle}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(AlertRequest(
      title: title,
      description: description,
      okButtonTitle: okButtonTitle,
     // cancelButtonTitle: cancelButtonTitle,
    ));
    return _dialogCompleter!.future;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter =  Completer<AlertResponse>();
  }
}
DialogService dialogService =DialogService();