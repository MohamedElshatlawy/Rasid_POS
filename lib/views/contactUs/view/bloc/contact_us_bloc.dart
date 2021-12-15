import 'package:rasid_jack/base/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ContactUsBloc extends BlocBase {
  dynamic initalVal = 'Thomas';

  dynamic names = [];
  BehaviorSubject _dropdownValues = BehaviorSubject();
  Stream get dropdownValuesStream => _dropdownValues.stream;
  ContactUsBloc({required this.names}) {
    _dropdownValues = BehaviorSubject.seeded(this.names);
  }
  void selectedITem(item) {
    initalVal = item;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dropdownValues.close();
  }
}
