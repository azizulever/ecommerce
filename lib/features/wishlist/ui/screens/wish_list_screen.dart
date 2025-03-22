import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:projects/features/common/ui/widgets/product_item_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: _onPop,
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return FittedBox(child: ProductItemWidget());
          },
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
