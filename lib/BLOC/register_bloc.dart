import "dart:async";
import 'package:rxdart/rxdart.dart';
import 'package:instagramcloneflutter/VALIDATOR/register_validator.dart';

abstract class Dispose{
  void dispose();
}

class RegisterBloc extends Object with RValidator implements Dispose{
  
  final _emailController=BehaviorSubject<String>();
  final _passwordController=BehaviorSubject<String>();

  
  Function(String) get emailChanged=>_emailController.sink.add;
  Function(String) get passwordChanged=>_passwordController.sink.add;
  Stream<String> get email=>_emailController.stream.transform(emailValidator);
  Stream<String> get pass=>_passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck=>Observable.combineLatest2(email, pass, (e,p)=>true);
  

  submit(){
      print("BUTTON CLICKED");
      print(_emailController.value);
      print(_passwordController.value);
      
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();
    _passwordController?.close();
  }
  
}