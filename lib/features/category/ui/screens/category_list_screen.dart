import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:projects/features/common/ui/widgets/category_item_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = 'category-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category list'),
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: const CategoryItemWidget());
        },
      ),
    );
  }
}
