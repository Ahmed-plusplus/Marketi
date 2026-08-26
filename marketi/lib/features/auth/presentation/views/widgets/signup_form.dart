import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/auth/data/models/signup_params.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/generated/assets.dart';

class SignupForm extends StatelessWidget {
  SignupForm({
    super.key,
    required this.cubit,
    required this.formKey,
    required this.signupParams,
  });

  final AuthCubit cubit;
  final GlobalKey formKey;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  SignupParams signupParams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              labelText: AppStrings.yourName,
              hintText: AppStrings.fullNameHint,
              prefixIcon: Assets.images.nameIcon.svg(),
              onChanged: (name) => signupParams.name = name,
            ),
            CustomTextFormField(
              controller: usernameController,
              labelText: AppStrings.username,
              hintText: AppStrings.username,
              prefixIcon: Assets.images.userIcon.svg(),
            ),
            CustomTextFormField(
              controller: phoneController,
              labelText: AppStrings.phoneNumber,
              hintText: AppStrings.phoneNoHint,
              keyboardType: TextInputType.phone,
              onChanged: (phone) => signupParams.phone = phone,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.phoneIcon.svg(),
                  SizedBox(width: 12,),
                  Assets.images.arrowIcon.svg(),
                ],
              ),
            ),
            CustomTextFormField(
              controller: emailController,
              labelText: AppStrings.email,
              hintText: AppStrings.emailHint,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Assets.images.emailIcon.svg(),
              onChanged: (email) => signupParams.email = email,
            ),
            CustomTextFormField(
              controller: passwordController,
              labelText: AppStrings.password,
              hintText: AppStrings.password,
              prefixIcon: Assets.images.passwordIcon.svg(),
              suffixIcon: GestureDetector(
                child: Assets.images.eyeOff.svg(),
                onTap: () => cubit.changeSignupPasswordVisibility(),
              ),
              obscureText: cubit.isSignupPasswordVisible,
              onChanged: (password) => signupParams.password = password,
            ),
            CustomTextFormField(
              controller: confirmPasswordController,
              labelText: AppStrings.confirmPassword,
              hintText: AppStrings.password,
              prefixIcon: Assets.images.passwordIcon.svg(),
              suffixIcon: GestureDetector(
                child: Assets.images.eyeOff.svg(),
                onTap: () => cubit.changeSignupConfirmPasswordVisibility(),
              ),
              obscureText: cubit.isSignupConfirmPasswordVisible,
              validator: (password){
                if(password != signupParams.password) {
                  return 'mismatch password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
