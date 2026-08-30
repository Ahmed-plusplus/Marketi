import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';
import 'package:marketi/features/auth/presentation/views/widgets/header_auth_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/phone_text_field.dart';
import 'package:marketi/generated/assets.dart';

class ForgetPasswordWithPhoneView extends StatefulWidget {
  const ForgetPasswordWithPhoneView({super.key});

  @override
  State<ForgetPasswordWithPhoneView> createState() => _ForgetPasswordWithPhoneViewState();
}

class _ForgetPasswordWithPhoneViewState extends State<ForgetPasswordWithPhoneView> {

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
                      Assets.images.illustrationForgotPasswordWithPhone.image(width: 300, height: 256),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Text(AppStrings.forgetPasswordBody1, maxLines: 2, textAlign: TextAlign.center,),
                      ),
                      PhoneTextField(controller: controller,),
                      const SizedBox(height: 22,),
                      BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state){
                          if(state is SendSMSSuccessfulStates){
                            customReplacementNavigate(context, RoutesName.verificationCodeWithPhone, extra: state.phone);
                          } else if(state is SendSMSFailedStates){
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
                            isLoading: state is SendSMSLoadingStates,
                            onPressed: () => cubit.sendSMS(controller.text),
                          );
                        }
                      ),
                      const SizedBox(height: 22,),
                      GestureDetector(
                        onTap: () => customNavigate(context, RoutesName.forgetPasswordWithEmail),
                        child: Text(AppStrings.tryAnotherWay, style: TextStyle(color: AppColors.primary),),
                      ),
                      const SizedBox(height: 117,),
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
