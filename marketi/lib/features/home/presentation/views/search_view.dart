import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit.dart';
import 'package:marketi/features/home/presentation/views/widget/header_home_widget.dart';
import 'package:marketi/features/home/presentation/views/widget/product_item_widget.dart';
import 'package:marketi/generated/assets.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  ValueNotifier<List<ProductModel>> productList = ValueNotifier([]);

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if(query.isEmpty){
        productList.value = [];
        return;
      }
      productList.value = widget.cubit.products.where((product) => product.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
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
                  valueListenable: productList,
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
                      children: list.map((product) => ProductItemWidget(product: product)).toList(),
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
