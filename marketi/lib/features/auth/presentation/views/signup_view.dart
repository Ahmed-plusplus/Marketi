import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_back_button.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/features/auth/data/models/signup_params.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';
import 'package:marketi/generated/assets.dart';

import 'widgets/account_button.dart';
import 'widgets/signup_form.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  late AuthCubit _cubit;
  GlobalKey<FormState> formKey = GlobalKey();
  SignupParams params = SignupParams();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state){
                if(state is SignupSuccessfulStates){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                  customBackNavigation(context);
                } else if(state is SignupFailedStates){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                _cubit = AuthCubit.get(context);
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBackButton(),
                        SizedBox(width: 20,),
                        Assets.images.logoSignup.image(width: 190, height: 160, ),
                      ],
                    ),
                    SignupForm(cubit: _cubit, formKey: formKey, signupParams: params,),
                    SizedBox(height: 14,),
                    CustomElevatedButton(
                      text: AppStrings.signup,
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          _cubit.signup(params);
                        }
                      },
                      isLoading: state is SignupLoadingStates,
                    ),
                    SizedBox(height: 12,),
                    Text(AppStrings.loginWith),
                    SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AccountButton(icon: Assets.images.googleIcon.svg()),
                        SizedBox(width: 16,),
                        AccountButton(icon: Assets.images.appleIcon.svg()),
                        SizedBox(width: 16,),
                        AccountButton(icon: Assets.images.facebokIcon.svg())
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
