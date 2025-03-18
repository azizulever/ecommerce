import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projects/app/assets_path.dart';
import 'package:projects/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:projects/features/common/ui/widgets/category_item_widget.dart';
import 'package:projects/features/common/ui/widgets/product_item_widget.dart';
import 'package:projects/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:projects/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:projects/features/home/ui/widgets/home_section_header.dart';
import 'package:projects/features/home/ui/widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(controller: _searchBarController),
              SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getCategoryList()),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Special', onTap: () {}),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'New', onTap: () {}),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getProductList()),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(icon: Icons.person_outline, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.notifications_on_outlined, onTap: () {}),
      ],
    );
  }
}
