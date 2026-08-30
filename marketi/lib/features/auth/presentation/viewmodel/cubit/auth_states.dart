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

class SendSMSLoadingStates extends AuthStates {}
class SendSMSSuccessfulStates extends AuthStates {
  String phone;
  String? message;
  SendSMSSuccessfulStates(this.phone, this.message);
}
class SendSMSFailedStates extends AuthStates {
  String message;
  SendSMSFailedStates(this.message);
}

class SendEmailLoadingStates extends AuthStates {}
class SendEmailSuccessfulStates extends AuthStates {
  String email;
  String? message;
  SendEmailSuccessfulStates(this.email, this.message);
}
class SendEmailFailedStates extends AuthStates {
  String message;
  SendEmailFailedStates(this.message);
}
