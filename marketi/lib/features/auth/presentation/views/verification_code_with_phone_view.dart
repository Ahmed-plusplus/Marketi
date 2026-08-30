import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/viewmodel/cubit/auth_states.dart';
import 'package:marketi/generated/assets.dart';
import 'package:simple_timer_count_down/simple_timer_count_down.dart';

import 'widgets/header_auth_widget.dart';

class VerificationCodeWithPhoneView extends StatefulWidget {
  const VerificationCodeWithPhoneView({super.key, required this.phone});

  final String phone;

  @override
  State<VerificationCodeWithPhoneView> createState() => _VerificationCodeWithPhoneViewState();
}

class _VerificationCodeWithPhoneViewState extends State<VerificationCodeWithPhoneView> {

  late AuthCubit _cubit;
  String? code;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              HeaderAuthWidget(header: AppStrings.verificationCodeHeader),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 44,),
                      Assets.images.illustrationVerificationCodeWithPhone.image(width: 300, height: 256),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Text(AppStrings.forgetPasswordBody1, maxLines: 2, textAlign: TextAlign.center,),
                      ),
                      VerificationCode(
                        keyboardType: TextInputType.number,
                        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                        autofocus: true,
                        length: 4,
                        digitsOnly: true,
                        fullBorder: true,
                        itemSize: 40.0,
                        textStyle: TextStyle(
                          fontSize: 20.0,

                        ),
                        underlineColor: AppColors.lightBlue700.withAlpha(180),
                        underlineUnfocusedColor: AppColors.lightBlue700.withAlpha(180),
                        underlineWidth: 2,
                        onCompleted: (value){
                          code = value;
                        },
                        onEditing: (canEdit){
                          bool complete = !canEdit;
                          if(complete) {
                            FocusScope.of(context).unfocus();
                          } else {
                            code = null;
                          }
                        },
                      ),
                      const SizedBox(height: 22,),
                      BlocConsumer<AuthCubit, AuthStates>(
                          listener: (context, state){
                            if(state is VerifyCodeSuccessfulStates){
                              customReplacementNavigate(context, RoutesName.changePassword, extra: widget.phone);
                            } else if(state is VerifyCodeFailedStates){

                            }
                          },
                          builder: (context, state) {
                            _cubit = AuthCubit.get(context);
                            return CustomElevatedButton(
                              text: AppStrings.verifyCode,
                              isLoading: state is VerifyCodeLoadingStates,
                              onPressed: () {
                                if(code != null) {
                                  _cubit.verifyCode(widget.phone, code!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Complete code first'),
                                    ),
                                  );
                                }
                              }
                            );
                          }
                      ),
                      SimpleTimerCountDown(
                        duration: Duration(seconds: 59),
                        builder: (context, remainingTime) {
                          var seconds = remainingTime.inSeconds;
                          return Text(
                            '00:${(seconds < 10) ? '0$seconds' : seconds.toString()}',
                            style: TextStyle(fontSize: 16),
                          );
                        },
                      ),
                      const SizedBox(height: 22,),
                      GestureDetector(
                        onTap: () => _cubit.resendCode(widget.phone),
                        child: Text(AppStrings.resendCode, ),
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
