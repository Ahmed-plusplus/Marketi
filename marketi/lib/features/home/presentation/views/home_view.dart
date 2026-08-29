import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_cubit.dart';
import 'package:marketi/features/home/presentation/viewmodel/home_states.dart';
import 'package:marketi/features/home/presentation/views/widget/category_item_widget.dart';
import 'package:marketi/features/home/presentation/views/widget/home_search_widget.dart';
import 'package:marketi/features/home/presentation/views/widget/product_item_widget.dart';
import 'package:marketi/generated/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late HomeCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 10,),
                  Expanded(child: Text(AppStrings.hi('name'))),
                  Assets.images.bellOnIcon.svg(),
                ],
              ),
              SizedBox(height: 14,),
              HomeSearchWidget(),
              SizedBox(height: 14,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(AppStrings.popularProductHeader)),
                          GestureDetector(
                            onTap: () => customNavigate(context, RoutesName.product),
                            child: Text(AppStrings.viewAll, style: TextStyle(color: AppColors.primary),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 170,
                        child: BlocBuilder<HomeCubit, HomeStates>(
                            builder: (context, state) {
                              _cubit = HomeCubit.get(context);
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: min(10, _cubit.products.length),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ProductItemWidget(product: _cubit.products[index]),
                                  );
                                },
                              );
                            }
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Text(AppStrings.categoryHeader)),
                          GestureDetector(
                            onTap: () => customNavigate(context, RoutesName.allCategories),
                            child: Text(AppStrings.viewAll, style: TextStyle(color: AppColors.primary),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 340,
                        child: BlocBuilder<HomeCubit, HomeStates>(
                            builder: (context, state) {
                              _cubit = HomeCubit.get(context);
                              return GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: _cubit.categories.sublist(0, min(6, _cubit.categories.length))
                                .map((category){
                                  return CategoryItemWidget(category: category);
                                }).toList(),
                              );
                            }
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Text(AppStrings.brandsHeader)),
                          GestureDetector(
                            onTap: () => customNavigate(context, RoutesName.allBrands),
                            child: Text(AppStrings.viewAll, style: TextStyle(color: AppColors.primary),),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 170,
                      //   child: BlocBuilder<HomeCubit, HomeStates>(
                      //       builder: (context, state) {
                      //         _cubit = HomeCubit.get(context);
                      //         return GridView.count(
                      //           crossAxisCount: 3,
                      //           shrinkWrap: true,
                      //           physics: NeverScrollableScrollPhysics(),
                      //           children: _cubit.brands.sublist(0, min(3, _cubit.brands.length))
                      //               .map((brand){
                      //             return Card(
                      //               child: Container(
                      //                 width: 105,
                      //                 height: 96,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   border: Border.all(color: AppColors.lightBlue700.withAlpha(180),),
                      //                 ),
                      //                 child: CachedNetworkImage(imageUrl: brand.emoji!),
                      //               ),
                      //             );
                      //           }).toList(),
                      //         );
                      //       }
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
