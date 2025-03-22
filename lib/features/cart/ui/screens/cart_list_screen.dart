import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/features/common/ui/controllers/main_bottom_nav_controller.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: _onPop,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile();
                },
              ),
            ),
            _buildPriceAndCheckoutSelection(textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSelection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price', style: textTheme.titleSmall),
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
            child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
          ),
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
