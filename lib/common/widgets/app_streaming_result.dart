import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../request_state.dart';
import '../request_status.dart';

class AppStreamingResult extends StatelessWidget {
  final BehaviorSubject<RequestState> subject;
  final Widget successWidget;

  AppStreamingResult({required this.subject, required this.successWidget});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: subject.stream,
        builder: (context, AsyncSnapshot<RequestState> snapshot) {
          if (snapshot.data == null) return SizedBox();
          switch (snapshot.data!.status) {
            case RequestStatus.LOADING:
              // TODO: Handle this case.
              return Text(snapshot.data!.message);

            case RequestStatus.SUCCESS:
              // TODO: Handle this case.
              return successWidget;

            case RequestStatus.ERROR:
              // TODO: Handle this case.
              return Text(snapshot.data!.message);

            case RequestStatus.NO_DATA:
              // TODO: Handle this case.
              return Text(snapshot.data!.message);
          }
        });
  }
}
