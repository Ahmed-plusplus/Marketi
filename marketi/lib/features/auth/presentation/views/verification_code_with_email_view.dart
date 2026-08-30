import 'package:flutter/material.dart';

class VerificationCodeWithEmailView extends StatefulWidget {
  const VerificationCodeWithEmailView({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodeWithEmailView> createState() => _VerificationCodeWithEmailViewState();
}

class _VerificationCodeWithEmailViewState extends State<VerificationCodeWithEmailView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
