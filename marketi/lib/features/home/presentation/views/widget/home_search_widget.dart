import 'package:flutter/material.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit/home_cubit.dart';
import 'package:marketi/generated/assets.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key, required this.cubit});

  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => customNavigate(context, RoutesName.search, extra: cubit),
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent)),
      child: Row(
        children: [
          Assets.images.searchIcon.svg(),
          Expanded(child: Text(AppStrings.searchHint)),
          GestureDetector(
            child: Assets.images.filterIcon.svg(),
          ),
        ],
      ),
    );
  }
}
