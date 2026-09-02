import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatelessWidget {
  ProductImageSlider({super.key, required this.images});

  final List<String> images;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: CarouselView.builder(
            itemCount: images.length,
            itemExtent: double.infinity,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
              );
            },
            controller: _controller,
          ),
        ),
        SizedBox(height: 8),
        Flexible(
          flex: 1,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToItem(index);
                  },
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
