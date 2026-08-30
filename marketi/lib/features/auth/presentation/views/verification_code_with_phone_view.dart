import 'package:flutter/material.dart';

class VerificationCodeWithPhoneView extends StatefulWidget {
  const VerificationCodeWithPhoneView({super.key, required this.phone});

  final String phone;

  @override
  State<VerificationCodeWithPhoneView> createState() => _VerificationCodeWithPhoneViewState();
}

class _VerificationCodeWithPhoneViewState extends State<VerificationCodeWithPhoneView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
