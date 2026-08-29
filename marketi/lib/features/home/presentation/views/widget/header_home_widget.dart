import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_back_button.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key, required this.header});

  final String header;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(),
        Expanded(child: Center(child: Text(header))),
        CircleAvatar(),
      ],
    );
  }
}
