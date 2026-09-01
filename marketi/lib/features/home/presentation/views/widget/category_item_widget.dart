import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/features/home/data/models/submodels/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Container(
              width: double.infinity,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.lightBlue700.withAlpha(180),),
              ),
              child: CachedNetworkImage(imageUrl: category.image!),
            ),
          ),
          Text(category.name!)
        ],
      ),
    );
  }
}
