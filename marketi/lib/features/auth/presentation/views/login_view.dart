import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/app_themes.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/core/widgets/custom_outlined_button.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';
import 'package:marketi/features/auth/presentation/views/widgets/account_button.dart';
import 'package:marketi/generated/assets.dart';

import '../viewmodel/functions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {

              },
              builder: (context, state) {
                cubit = AuthCubit.get(context);
                return Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topStart,
                      child: CustomOutlinedButton(
                        text: AppStrings.skip,
                        onPressed: () => goToHomeScreen(context),
                        style: textOutlinedButtonStyle.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 22,),
                    Center(child: Assets.images.logoLogin.image(width: 272, height: 232),),
                    const SizedBox(height: 32,),
                    CustomTextField(
                      controller: emailController,
                      hintText: AppStrings.usernameOrEmailHint,
                      prefixIcon: Assets.images.emailIcon.svg(width: 16, height: 16),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      prefixIcon: Assets.images.passwordIcon.svg(width: 16, height: 16),
                      suffixIcon: GestureDetector(
                        onTap: () => cubit.changeLoginPasswordVisibility(),
                        child: Assets.images.eyeOff.svg(width: 16, height: 16, ),
                      ),
                      obscureText: cubit.isLoginPasswordVisible,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: cubit.isRememberMeChecked,
                          onChanged: (isChecked) => cubit.changeRememberMeCheck(),
                        ),
                        Text(AppStrings.rememberMe),
                        Spacer(),
                        GestureDetector(
                          onTap: () => customReplacementNavigate(context, RoutesName.forgetPasswordWithPhone),
                          child: Text(AppStrings.forgetPassword, style: TextStyle(color: AppColors.primary),),
                        ),
                      ],
                    ),
                    CustomElevatedButton(text: AppStrings.login, onPressed: () => null),
                    Text(AppStrings.loginWith),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.newUser),
                        GestureDetector(
                          onTap: () => customReplacementNavigate(context, RoutesName.signUp),
                          child: Text(AppStrings.register, style: TextStyle(color: AppColors.primary),),
                        ),
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
