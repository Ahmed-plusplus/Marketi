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