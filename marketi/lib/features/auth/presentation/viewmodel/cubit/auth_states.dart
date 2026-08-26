abstract class AuthStates {}

class AuthInitStates extends AuthStates {}

class ChangeLoginPasswordVisibility extends AuthStates{}
class ChangeSignupPasswordVisibility extends AuthStates{}
class ChangeSignupConfirmPasswordVisibility extends AuthStates{}

class ChangeRememberMeCheck extends AuthStates{}

class LoginLoadingStates extends AuthStates {}
class LoginSuccessfulStates extends AuthStates {
  String? message;
  LoginSuccessfulStates(this.message);
}
class LoginFailedStates extends AuthStates {
  String message;
  LoginFailedStates(this.message);
}

class SignupLoadingStates extends AuthStates {}
class SignupSuccessfulStates extends AuthStates {
  String? message;
  SignupSuccessfulStates(this.message);
}
class SignupFailedStates extends AuthStates {
  String message;
  SignupFailedStates(this.message);
}