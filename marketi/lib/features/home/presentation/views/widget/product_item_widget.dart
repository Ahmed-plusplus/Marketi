import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/routes/app_navigation.dart';
import 'package:marketi/core/routes/routes_name.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/features/home/data/models/submodels/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product, this.onFavorite});

  final ProductModel product;

  final GestureTapCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => customNavigate(context, RoutesName.productDetails, extra: product.id!),
      child: SizedBox(
        width: 160,
        height: 150,
        child: Card(
          child: Container(
            width: 160,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightBlue700,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 96,
                    width: 152,
                    child: Stack(
                      children: [
                        // Background
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: AppColors.lightBlue900,
                            ),
                          ),
                        ),

                        // Discount part
                        if ((product.discountPercentage ?? 0.0) > 0)
                          Positioned(
                            left: 0,
                            top: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                              ),
                              child: Container(
                                width: 82,
                                height: 24,
                                color: AppColors.lightBlue700.withAlpha(200),
                                child: Center(
                                  child: Text(
                                    '${product.discountPercentage}% OFF',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4384FF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Product image
                        if(product.thumbnail != null)
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: product.thumbnail!,
                              width: 100,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ),

                        // Favorite button
                        Positioned(
                          right: 8,
                          top: 8,
                          child: GestureDetector(
                            onTap: onFavorite,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: AppColors.darkBlue900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      Text(
                        '${product.price?.toStringAsFixed(0)} LE',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF06245B),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star_border_rounded,
                        size: 14,
                        color: Color(0xFF06245B),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF06245B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.title!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF06245B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
