import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/auth/data/models/signup_request.dart';
import 'package:marketi/generated/assets.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key, required this.controller, this.signupParams});

  final TextEditingController controller;
  final SignupRequest? signupParams;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: AppStrings.phoneNumber,
      hintText: AppStrings.phoneNoHint,
      keyboardType: TextInputType.phone,
      onChanged: (phone) => signupParams?.phone = phone,
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.phoneIcon.svg(),
          SizedBox(width: 12,),
          Assets.images.arrowIcon.svg(),
        ],
      ),
    );
  }
}
