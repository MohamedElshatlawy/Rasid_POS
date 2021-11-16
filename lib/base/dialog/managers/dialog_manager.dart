import 'package:flutter/material.dart';
import 'package:rasid_jack/base/dialog/data_models/alert_request.dart';
import 'package:rasid_jack/base/dialog/data_models/alert_response.dart';
import 'package:rasid_jack/base/dialog/services/dialog_service.dart';
import 'package:rasid_jack/utilities/size_config.dart';


class DialogManager extends StatefulWidget {
  final Widget? child;

  DialogManager({Key? key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {

  @override
  void initState() {
    super.initState();
    dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  void _showDialog(AlertRequest request) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => new AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: new Text(request.title),
        content: new Text(
          request.description,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          if (request.cancelButtonTitle != null)
            TextButton(style: TextButton.styleFrom(minimumSize: Size(SizeConfig.safeBlockHorizontal*25, SizeConfig.btnHeight)),
              onPressed: () {
                dialogService.dialogComplete(AlertResponse(confirmed: false));
                Navigator.of(context).pop();
              },
              child: new Text(request.cancelButtonTitle??'',
                  textAlign: TextAlign.center),
            ),
          TextButton(style: TextButton.styleFrom(minimumSize: Size(SizeConfig.safeBlockHorizontal*25, SizeConfig.btnHeight)),
            onPressed: () {
              dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
            },
            child:
                new Text(request.okButtonTitle, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
