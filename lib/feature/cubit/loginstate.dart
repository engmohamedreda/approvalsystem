

import '../../core/failures.dart';

abstract class LoginStates {}

class LoginLoadingState extends LoginStates {}
class LogininitalState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures errormessage;
  LoginErrorState({required this.errormessage});
}

class LoginSuccessState extends LoginStates {
}
