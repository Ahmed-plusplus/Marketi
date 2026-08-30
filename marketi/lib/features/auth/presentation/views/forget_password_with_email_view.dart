import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';
import 'package:marketi/generated/assets.dart';

import 'widgets/email_text_field.dart';
import 'widgets/header_auth_widget.dart';

class ForgetPasswordWithEmailView extends StatefulWidget {
  const ForgetPasswordWithEmailView({super.key});

  @override
  State<ForgetPasswordWithEmailView> createState() => _ForgetPasswordWithEmailViewState();
}

class _ForgetPasswordWithEmailViewState extends State<ForgetPasswordWithEmailView> {

  TextEditingController controller = TextEditingController();
  late AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              HeaderAuthWidget(header: AppStrings.forgetPasswordHeader),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 44,),
                      Assets.images.illustrationForgotPasswordWithEmail.image(width: 300, height: 256),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Text(AppStrings.forgetPasswordBody2, maxLines: 2, textAlign: TextAlign.center,),
                      ),
                      EmailTextField(controller: controller,),
                      const SizedBox(height: 22,),
                      BlocConsumer<AuthCubit, AuthStates>(
                          listener: (context, state){
                            if(state is SendEmailSuccessfulStates){
                              customNavigate(context, RoutesName.verificationCodeWithEmail, extra: state.email);
                            } else if(state is SendEmailFailedStates){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            cubit = AuthCubit.get(context);
                            return CustomElevatedButton(
                              text: AppStrings.sendCode,
                              isLoading: state is SendEmailLoadingStates,
                              onPressed: () => cubit.sendEmail(controller.text),
                            );
                          }
                      ),
                      const SizedBox(height: 165,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
