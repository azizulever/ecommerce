import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projects/app/app_colors.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({super.key});

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.themeColor.withOpacity(0.12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Product Carousel Photo $i',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            value == i
                                ? AppColors.themeColor
                                : Colors.transparent,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
