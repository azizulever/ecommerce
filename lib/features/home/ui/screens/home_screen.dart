import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/app/assets_path.dart';
import 'package:projects/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:projects/features/home/ui/widgets/home_carousel_slider.dart';
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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  TextButton(onPressed: () {}, child: Text('View all')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
