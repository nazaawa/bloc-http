import 'dart:async';

import 'package:bloc_exercice/src/database/database.dart';
import 'package:bloc_exercice/src/model/model.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // afficher les données
  Stream<String> get email => _email.stream.transform(validEmail);
  Stream <String> get password => _password.stream.transform(validPassword);
  Stream <bool> get submitValid => CombineLatestStream.combine2(email, password, (a, p) => true);
  void Function(String) get changeEmail => _email.sink.add;
  void Function(String) get changePassword => _password.sink.add;
  

  submit(){
    final name = _email.value;
    final pass = _password.value;

    Model model = Model(email: name, password: pass);
    DatabaseProvider.instance.addNew(model);
   
  }

  final validEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Entre un mail valid');
    }
  });
  final validPassword = StreamTransformer<String , String>.fromHandlers(
    handleData :(password , sink){
      if (password.length > 5){
        sink.add(password);
      }else {
        sink.addError('Pas moin de 5 lettre');
      }
    }
  );

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();