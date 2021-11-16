import 'request_status.dart';

class RequestState {
   RequestStatus status= RequestStatus.LOADING;
   String message='LOADING';

  RequestState({ required this.status,  required this.message});
}
