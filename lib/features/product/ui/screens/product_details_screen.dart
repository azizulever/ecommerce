import 'package:flutter/material.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/features/product/ui/widgets/color_picker_widget.dart';
import 'package:projects/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:projects/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:projects/features/product/ui/widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Apex latest RSH823 - New year special deal',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Reviews'),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: AppColors.themeColor,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // const SizedBox(width: 8),
                            ProductQuantityIncDecButton(
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('Color', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ColorPickerWidget(
                          colors: ['Red', 'Green', 'Yellow', 'Black'],
                          onColorSelected: (String selectedColor) {},
                        ),
                        const SizedBox(height: 16),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        SizePickerWidget(
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onSizeSelected: (String selectedSize) {},
                        ),
                        const SizedBox(height: 16),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSelection(textTheme),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSelection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text(
                '\$1,000',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
          ),
        ],
      ),
    );
  }
}
