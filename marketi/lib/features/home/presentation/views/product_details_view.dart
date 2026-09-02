import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/app_themes.dart';
import 'package:marketi/core/widgets/custom_back_button.dart';
import 'package:marketi/features/home/presentation/viewmodel/product_details_cubit/product_details_cubit.dart';
import 'package:marketi/features/home/presentation/viewmodel/product_details_cubit/product_details_states.dart';
import 'package:marketi/features/home/presentation/views/widget/product_image_slider.dart';
import 'package:marketi/generated/assets.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  late ProductDetailsCubit _cubit;

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
                  CustomBackButton(),
                  Expanded(child: Center(child: Text(AppStrings.productDetailsHeader))),
                  Stack(
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: GestureDetector(
                          onTap: () {},
                          child: Assets.images.cartIcon.svg(),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.darkBlue100,
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                    builder: (context, state) {
                      _cubit = ProductDetailsCubit.get(context);
                      return Column(
                        children: [
                          SizedBox(
                            height: 350,
                            child: ProductImageSlider(images: _cubit.productDetails?.images ?? [])
                          ),
                          SizedBox(height: 14,),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () => null,
                                style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(142, 20))),
                                child: Text(AppStrings.freeShopping, style: textOutlinedButtonStyle,),
                              ),
                              Spacer(),
                              // SizedBox(
                              //   width: 90,
                              //   height: 20,
                              //   child: RatingStars(
                              //     value: _cubit.productDetails?.rating ?? 0.0,
                              //     starSize: 15,
                              //     starColor: AppColors.darkBlue900,
                              //   ),
                              // ),
                              Text('(${_cubit.productDetails?.rating ?? ''})', style: TextStyle(fontSize: 12, ),),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(_cubit.productDetails?.title ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 8,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppStrings.productValue, style: TextStyle(fontSize: 16),),
                          ),
                          SizedBox(height: 4,),
                          Text(_cubit.productDetails?.description ?? '',
                            maxLines: 4,
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 12, color: AppColors.darkBlue900),
                          ),
                          SizedBox(height: 14,),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      AppStrings.price,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4,),
                                    Text(
                                      '${_cubit.productDetails?.price ?? '0'} EGP',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  onPressed: () => null,
                                  style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(142, 40))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Assets.images.cartIcon.svg(),
                                      SizedBox(width: 4,),
                                      Text(AppStrings.addToCart, style: textOutlinedButtonStyle,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
