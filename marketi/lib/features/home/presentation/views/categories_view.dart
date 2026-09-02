import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/home/data/models/submodels/category_model.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/views/widget/category_item_widget.dart';
import 'package:marketi/generated/assets.dart';

import 'widget/header_home_widget.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  ValueNotifier<List<CategoryModel>> categoryList = ValueNotifier([]);

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if(query.isEmpty){
        categoryList.value = [];
        return;
      }
      categoryList.value = widget.cubit.categories.where((category) => category.name?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              HeaderHomeWidget(header: ''),
              SizedBox(height: 14,),
              CustomTextFormField(
                controller: _controller,
                hintText: AppStrings.searchHint,
                onChanged: (query) => _onSearchChanged(query),
                prefixIcon: Assets.images.searchIcon.svg(),
                suffixIcon: GestureDetector(
                  child: Assets.images.filterIcon.svg(),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: categoryList,
                  builder: (context, list, child){
                    if(list.isEmpty && _controller.text.isNotEmpty){
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Assets.images.illustrationSearchNotFound.image(width: 275, height: 256),
                            SizedBox(height: 22,),
                            Text(AppStrings.notFoundSearchTitle),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(AppStrings.notFoundSearchBody, maxLines: 2, textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      physics: BouncingScrollPhysics(),
                      children: list.map((category) => CategoryItemWidget(category: category)).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
