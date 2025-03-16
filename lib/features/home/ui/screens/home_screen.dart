import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/app/app_colors.dart';
import 'package:projects/app/assets_path.dart';
import 'package:projects/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:projects/features/home/ui/widgets/category_item_widget.dart';
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
              HomeSectionHeader(title: 'All Categories', onTap: () {}),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: _getCategoryList()),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              const SizedBox(height: 4),
              SizedBox(
                width: 120,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withOpacity(0.14),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/shoe.png',
                          width: 120,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Apex latest edition - RSH823',
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
