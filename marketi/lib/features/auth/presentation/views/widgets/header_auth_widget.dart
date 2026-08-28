import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_themes.dart';
import 'package:marketi/core/widgets/custom_back_button.dart';

class HeaderAuthWidget extends StatelessWidget {
  const HeaderAuthWidget({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(),
        const SizedBox(width: 8,),
        Text(header, style: textHeaderStyle,),
      ],
    );
  }
}
