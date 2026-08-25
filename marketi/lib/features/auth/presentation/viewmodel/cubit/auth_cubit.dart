import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/service/service_locator.dart';
import 'package:marketi/features/auth/data/repositories/auth_repository.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit(): super(AuthInitStates()){
    _repository = getIt<AuthRepository>();
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isLoginPasswordVisible = false;
  bool isSignupPasswordVisible = false;
  bool isSignupConfirmPasswordVisible = false;

  bool isRememberMeChecked = false;

  late AuthRepository _repository;

  void changeLoginPasswordVisibility(){
    isLoginPasswordVisible = !isLoginPasswordVisible;
    emit(ChangeLoginPasswordVisibility());
  }

  void changeSignupPasswordVisibility(){
    isSignupPasswordVisible = !isSignupPasswordVisible;
    emit(ChangeSignupPasswordVisibility());
  }

  void changeSignupConfirmPasswordVisibility(){
    isSignupConfirmPasswordVisible = !isSignupConfirmPasswordVisible;
    emit(ChangeSignupConfirmPasswordVisibility());
  }

  void changeRememberMeCheck(){
    isRememberMeChecked = !isRememberMeChecked;
    emit(ChangeRememberMeCheck());
  }

  Future<void> login(String email, String password) async{
    emit(LoginLoadingStates());
    final response = await _repository.login(email: email, password: password);
    response.fold(
      (signInModel) => emit(LoginSuccessfulStates(signInModel.message)),
        (failure) => emit(LoginFailedStates(failure.errMessage))
    );
  }
}