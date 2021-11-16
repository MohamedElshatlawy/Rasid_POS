import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  bool shown=false;
  late BuildContext context;

  bool isShowing() {
    return shown;
  }

  pop() {
    Navigator.of(context).pop();
  }

  @override
  createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  @override
  void initState() {
    super.initState();
    widget.shown = true;
  }

  @override
  Widget build(BuildContext context) {
    widget.shown = true;
    widget.context = context;
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black)),
    );
  }

  @override
  void dispose() {
    widget.shown = false;
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.shown = false;
  }
}
