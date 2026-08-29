import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_states.dart';
import 'package:marketi/features/home/presentation/views/widget/category_item_widget.dart';
import 'package:marketi/features/home/presentation/views/widget/home_search_widget.dart';

import 'widget/header_home_widget.dart';

class AllCategoriesView extends StatefulWidget {
  const AllCategoriesView({super.key});

  @override
  State<AllCategoriesView> createState() => _AllCategoriesViewState();
}

class _AllCategoriesViewState extends State<AllCategoriesView> {

  late HomeCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              HeaderHomeWidget(header: AppStrings.categoriesHeader,),
              SizedBox(height: 14,),
              HomeSearchWidget(),
              SizedBox(height: 14,),
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(AppStrings.allCategories),
              ),
              SizedBox(height: 14,),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) {
                    _cubit = HomeCubit.get(context);
                    return GridView.count(
                      crossAxisCount: 2,
                      physics: BouncingScrollPhysics(),
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      padding: EdgeInsets.all(0),
                      children: _cubit.categories
                          .map((category) => CategoryItemWidget(category: category))
                          .toList(),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
