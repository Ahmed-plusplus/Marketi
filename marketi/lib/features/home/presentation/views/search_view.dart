import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/app_themes.dart';
import 'package:marketi/core/widgets/custom_elevated_button.dart';
import 'package:marketi/core/widgets/custom_text_field.dart';
import 'package:marketi/features/home/presentation/viewmodel/search_cubit/search_cubit.dart';
import 'package:marketi/features/home/presentation/viewmodel/search_cubit/search_states.dart';
import 'package:marketi/features/home/presentation/views/widget/header_home_widget.dart';
import 'package:marketi/generated/assets.dart';

import 'widget/product_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  late SearchCubit _cubit;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if(query.isEmpty){
        _cubit.clearProducts();
        return;
      }
      _cubit.fetchProductsByName(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state){
              _cubit = SearchCubit.get(context);
              return Column(
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
                    child: SingleChildScrollView(
                      child: (_cubit.products.isEmpty && _controller.text.isNotEmpty) ? Center(
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
                        ) : (_cubit.products.isEmpty) ? Container()
                          : Column(
                        children: [
                          GridView.count(
                            crossAxisCount: 2,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: _cubit.products.map((product) => ProductItemWidget(product: product)).toList(),
                          ),
                          if(_cubit.canLoadMore)
                            CustomElevatedButton(
                              onPressed: () => _cubit.loadMoreProducts(_controller.text),
                              text: AppStrings.loadMoreProducts,
                              isLoading: state is SearchLoadingStates,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );

  }
}
