import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/generated/assets.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.controller, this.signupRequest});

  final TextEditingController controller;
  final SignupRequest? signupRequest;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: AppStrings.email,
      hintText: AppStrings.emailHint,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Assets.images.emailIcon.svg(),
      onChanged: (email) => signupRequest?.email = email,
    );
  }
}
